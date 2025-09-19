abstract class AddpropertiesEvent {}

class UpdateRoomArea extends AddpropertiesEvent {
  final String area;
  UpdateRoomArea(this.area);
}

class UpdateAccommodationType extends AddpropertiesEvent {
  final String type;
  UpdateAccommodationType(this.type);
}

class UpdatePropertySize extends AddpropertiesEvent {
  final String size;
  UpdatePropertySize(this.size);
}

class UpdateExtraBedType extends AddpropertiesEvent {
  final String bedType;
  UpdateExtraBedType(this.bedType);
}

class UpdateRoomPrice extends AddpropertiesEvent {
  final String roomPrice;
  UpdateRoomPrice(this.roomPrice);
}

class UpdatedExtraPersons extends AddpropertiesEvent {
  final String extraPersons;
  UpdatedExtraPersons(this.extraPersons);
}



class SubmitRoomForm extends AddpropertiesEvent {}
