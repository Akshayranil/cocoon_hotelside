part of 'booking_bloc.dart';

sealed class BookingHotelEvent {}

class FetchHotelBookings extends BookingHotelEvent {
  final String hotelUid;
  FetchHotelBookings(this.hotelUid);
}
