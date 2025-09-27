import 'package:cocoon_hotelside/model/room_model.dart';

abstract class RoomsEvent {}

class LoadRoomsEvent extends RoomsEvent {
  final String hotelId;
  LoadRoomsEvent(this.hotelId);
}

class AddRoomEvent extends RoomsEvent {
  final String hotelId;
  final Room room;
  AddRoomEvent({required this.hotelId, required this.room});
}

class UpdateRoomEvent extends RoomsEvent {
  final String hotelId;
  final Room room;
  UpdateRoomEvent({required this.hotelId, required this.room});
}

class DeleteRoomEvent extends RoomsEvent {
  final String hotelId;
  final String roomId;
  DeleteRoomEvent({required this.hotelId, required this.roomId});
}
