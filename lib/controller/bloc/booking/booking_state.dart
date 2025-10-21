part of 'booking_bloc.dart';


sealed class BookingHotelState {}

class BookingHotelInitial extends BookingHotelState {}
class BookingHotelLoading extends BookingHotelState {}
class BookingHotelLoaded extends BookingHotelState {
  final List<Map<String, dynamic>> bookings;
  BookingHotelLoaded(this.bookings);
}
class BookingHotelError extends BookingHotelState {
  final String message;
  BookingHotelError(this.message);
}