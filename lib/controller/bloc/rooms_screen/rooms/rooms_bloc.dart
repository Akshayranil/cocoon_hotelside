import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/rooms/rooms_event.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/rooms/rooms_state.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  final FirebaseFirestore firestore;

  RoomsBloc(this.firestore) : super(RoomsInitial()) {
    on<LoadRoomsEvent>((event, emit) async {
      emit(RoomsLoading());
      try {
        final snapshot = await firestore
            .collection("hotels")
            .doc(event.hotelId)
            .collection("rooms")
            .get();

        final rooms = snapshot.docs.map((doc) => doc.data()).toList();
        emit(RoomsLoaded(List<Map<String, dynamic>>.from(rooms)));
      } catch (e) {
        emit(RoomsError(e.toString()));
      }
    });

    on<AddRoomEvent>((event, emit) async {
      try {
        await firestore
            .collection("hotels")
            .doc(event.hotelId)
            .collection("rooms")
            .add(event.roomData);

        add(LoadRoomsEvent(event.hotelId)); // refresh after adding
      } catch (e) {
        emit(RoomsError(e.toString()));
      }
    });
  }
}
