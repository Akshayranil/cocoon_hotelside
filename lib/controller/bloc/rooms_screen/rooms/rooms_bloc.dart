import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/rooms/rooms_event.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/rooms/rooms_state.dart';
import 'package:cocoon_hotelside/model/room_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  final FirebaseFirestore firestore;

  RoomsBloc(this.firestore) : super(RoomsInitial()) {
    on<LoadRoomsEvent>(_onLoadRooms);
    on<AddRoomEvent>(_onAddRoom);
    on<UpdateRoomEvent>(_onUpdateRoom);
    on<DeleteRoomEvent>(_onDeleteRoom);
  }

  Future<void> _onLoadRooms(
      LoadRoomsEvent event, Emitter<RoomsState> emit) async {
    emit(RoomsLoading());
    try {
      final snapshot = await firestore
          .collection("hotelregistration")
          .doc(event.hotelId)
          .collection("rooms")
          .get();

      final rooms = snapshot.docs
          .map((doc) => Room.fromMap(doc.data()))
          .toList();

      emit(RoomsLoaded(rooms));
    } catch (e) {
      emit(RoomsError(e.toString()));
    }
  }

  Future<void> _onAddRoom(
      AddRoomEvent event, Emitter<RoomsState> emit) async {
    try {
      await firestore
          .collection("hotelregistration")
          .doc(event.hotelId)
          .collection("rooms")
          .doc(event.room.roomId)
          .set(event.room.toMap());

      add(LoadRoomsEvent(event.hotelId));
    } catch (e) {
      emit(RoomsError(e.toString()));
    }
  }

  Future<void> _onUpdateRoom(
      UpdateRoomEvent event, Emitter<RoomsState> emit) async {
    try {
      await firestore
          .collection("hotelregistration")
          .doc(event.hotelId)
          .collection("rooms")
          .doc(event.room.roomId)
          .update(event.room.toMap());

      add(LoadRoomsEvent(event.hotelId));
    } catch (e) {
      emit(RoomsError(e.toString()));
    }
  }

  Future<void> _onDeleteRoom(
      DeleteRoomEvent event, Emitter<RoomsState> emit) async {
    try {
      await firestore
          .collection("hotelregistration")
          .doc(event.hotelId)
          .collection("rooms")
          .doc(event.roomId)
          .delete();

      add(LoadRoomsEvent(event.hotelId));
    } catch (e) {
      emit(RoomsError(e.toString()));
    }
  }
}
