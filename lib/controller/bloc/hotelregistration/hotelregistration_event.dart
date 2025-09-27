part of 'hotelregistration_bloc.dart';

sealed class HotelregistrationEvent {
  const HotelregistrationEvent();
}

class UpdatedResidencyType extends HotelregistrationEvent {
  final String type;

  UpdatedResidencyType(this.type);
}

class UpdatedResidencyName extends HotelregistrationEvent {
  final String name;

  UpdatedResidencyName(this.name);
}

class UpdatedBookingTime extends HotelregistrationEvent {
  final String booking;

  UpdatedBookingTime(this.booking);
}

class UpdatedContactNumber extends HotelregistrationEvent {
  final String phonenumber;

  UpdatedContactNumber(this.phonenumber);
}

class UpdatedEmail extends HotelregistrationEvent {
  final String email;

  UpdatedEmail(this.email);
}

class UpdatedFacilities extends HotelregistrationEvent {
  final List<String> facilities;

  UpdatedFacilities(this.facilities);
}

class UpdatedHotelImages extends HotelregistrationEvent {
  final List<String> hotelimages;

  UpdatedHotelImages(this.hotelimages);
}

class UpdatedPan extends HotelregistrationEvent {
  final String pan;

  UpdatedPan(this.pan);
}

class UpdatedGSTDetails extends HotelregistrationEvent {
  final String gst;

  UpdatedGSTDetails(this.gst);
}

class UpdatedPropertyInformation extends HotelregistrationEvent {
  final String propertyinformation;

  UpdatedPropertyInformation(this.propertyinformation);
}

class UpdatedOwnedorLeased extends HotelregistrationEvent {
  final String isOwnedorLeased;

  UpdatedOwnedorLeased(this.isOwnedorLeased);
}

class UpdatedHaveRegistration extends HotelregistrationEvent {
  final String haveRegistration;

  UpdatedHaveRegistration(this.haveRegistration);
}

class UpdatedDocument extends HotelregistrationEvent {
  final String document;

  UpdatedDocument(this.document);
}

class SubmitHotelRegistration extends HotelregistrationEvent {}
