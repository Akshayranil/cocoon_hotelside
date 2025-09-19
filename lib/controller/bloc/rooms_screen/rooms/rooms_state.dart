abstract class RoomsState {}

class RoomsInitial extends RoomsState {}

class RoomsLoading extends RoomsState {}

class RoomsLoaded extends RoomsState {
  final List<Map<String, dynamic>> rooms;
  RoomsLoaded(this.rooms);
}

class RoomsError extends RoomsState {
  final String message;
  RoomsError(this.message);
}
