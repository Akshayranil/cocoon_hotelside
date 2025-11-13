import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingHotelEvent, BookingHotelState> {
  final FirebaseFirestore firestore;

  BookingBloc(this.firestore) : super(BookingHotelInitial()) {
    on<FetchHotelBookings>((event, emit) async {
      emit(BookingHotelLoading());
      try {
        final snapshot = await firestore
            .collection('hotelregistration')
            .doc(event.hotelUid)
            .collection('bookings')
            .get();

        final bookings = snapshot.docs.map((doc) {
          final data = doc.data();
          return {
            'roomId': data['roomId'] ?? '',
            'hotelName': data['hotelName'] ?? '',
            'location': data['location'] ?? '',
            'price': data['price'] ?? 0,
            'imageUrl': data['imageUrl'] ?? '', 
            'checkInDate': data['checkInDate'] ?? '',
            'checkOutDate': data['checkOutDate'] ?? '',
            'guests': data['guests'] ?? 0,
            'paymentStatus': data['paymentStatus'] ?? 'Pending',
            'timestamp':data['timestamp']??'',
            'userName':data['userName']??'Unknown',
            'userPhone' :data['userPhone']??'1234567890',

          };
        }).toList();

        emit(BookingHotelLoaded(bookings));
      } catch (e) {
        emit(BookingHotelError(e.toString()));
      }
    });
  }
}
