abstract class AddpropertiesEvent {}

class UpdateRoomArea extends AddpropertiesEvent {
  final int area;
  UpdateRoomArea(this.area);
}

class UpdateAccommodationType extends AddpropertiesEvent {
  final String type;
  UpdateAccommodationType(this.type);
}

class UpdatePropertySize extends AddpropertiesEvent {
  final int size;
  UpdatePropertySize(this.size);
}

class UpdateExtraBedType extends AddpropertiesEvent {
  final String extraBedType;
  UpdateExtraBedType(this.extraBedType);
}

class UpdateRoomPrice extends AddpropertiesEvent {
  final int roomPrice;
  UpdateRoomPrice(this.roomPrice);
}

class UpdateExtraPersons extends AddpropertiesEvent {
  final int extraPersons;
  UpdateExtraPersons(this.extraPersons);
}


class SubmitRoomDetailForm extends AddpropertiesEvent {

}

class AddAmenity extends AddpropertiesEvent {
  final String amenity;
  AddAmenity(this.amenity);
}

class RemoveAmenity extends AddpropertiesEvent {
  final String amenity;
  RemoveAmenity(this.amenity);
}


class AddImage extends AddpropertiesEvent {
  final String imageUrl;
  AddImage(this.imageUrl);
}

class RemoveImage extends AddpropertiesEvent {
  final String imageUrl;
  RemoveImage(this.imageUrl);
}


