import 'package:cocoon_hotelside/model/room_model.dart';

abstract class RoomsState {}

class RoomsInitial extends RoomsState {}

class RoomsLoading extends RoomsState {}

class RoomsLoaded extends RoomsState {
  final List<Room> rooms;
  RoomsLoaded(this.rooms);
}

class RoomsError extends RoomsState {
  final String message;
  RoomsError(this.message);
}
