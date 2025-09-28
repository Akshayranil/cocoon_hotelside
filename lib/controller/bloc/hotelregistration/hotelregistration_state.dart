part of 'hotelregistration_bloc.dart';

class HotelregistrationState {
  final String hotelId;
  final String type;
  final String name;
  final String booking;
  final String phonenumber;
  final String email;
  final List<String> facilities;
  final String pan;
  final String gst;
  final String propertyinformation;
  final String isOwnedorLeased;
  final String haveRegistration;
  final String document;
  final List<String> hotelimages;

  HotelregistrationState({
    this.hotelId = '',
    this.type = '',
    this.name = '',
    this.booking = '',
    this.phonenumber = '',
    this.email = '',
    this.facilities = const [],
    this.pan = '',
    this.gst = '',
    this.propertyinformation = '',
    this.isOwnedorLeased = '',
    this.haveRegistration = '',
    this.document = '',
    this.hotelimages = const [],
  });

  HotelregistrationState copyWith({
    
    String? hotelId,
    String? type,
    String? name,
    String? booking,
    String? phonenumber,
    String? email,
    List<String>? facilities,
    String? pan,
    String? gst,
    String? propertyinformation,
    String? isOwnedorLeased,
    String? haveRegistration,
    String? document,
    List<String>? hotelimages,
  }) {
    return HotelregistrationState(
      hotelId: hotelId??this.hotelId,
      name: name ?? this.name,
      type: type ?? this.type,
      booking: booking ?? this.booking,
      phonenumber: phonenumber ?? this.phonenumber,
      email: email ?? this.email,
      facilities: facilities ?? this.facilities,
      pan: pan ?? this.pan,
      gst: gst ?? this.gst,
      propertyinformation: propertyinformation ?? this.propertyinformation,
      isOwnedorLeased: isOwnedorLeased ?? this.isOwnedorLeased,
      haveRegistration: haveRegistration ?? this.haveRegistration,
      document: document ?? this.document,
      hotelimages: hotelimages ?? this.hotelimages,
    );
  }
}
