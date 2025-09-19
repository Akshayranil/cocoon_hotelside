abstract class RoomsEvent {}

class LoadRoomsEvent extends RoomsEvent {
  final String hotelId;
  LoadRoomsEvent(this.hotelId);
}

class AddRoomEvent extends RoomsEvent {
  final String hotelId;
  final Map<String, dynamic> roomData;
  AddRoomEvent({required this.hotelId, required this.roomData});
}
