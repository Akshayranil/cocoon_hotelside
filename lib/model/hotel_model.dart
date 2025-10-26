import 'package:cloud_firestore/cloud_firestore.dart';

class Hotel {
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
  final String status;
  final DateTime? createdAt;
  final List<String> hotelimages;
  final String price;
  Hotel({
    required this.type,
    required this.name,
    required this.booking,
    required this.phonenumber,
    required this.email,
    required this.facilities,
    required this.pan,
    required this.gst,
    required this.propertyinformation,
    required this.isOwnedorLeased,
    required this.haveRegistration,
    required this.document,
    required this.status,
    this.createdAt,
    required this.hotelimages,
    required this.price
  });

  Map<String, dynamic> toMap() => {
    'type': type,
    'name': name,
    'booking': booking,
    'phonenumber': phonenumber,
    'email': email,
    'facilities': facilities,
    'pan': pan,
    'gst': gst,
    'propertyinformation': propertyinformation,
    'isOwnedorLeased': isOwnedorLeased,
    'haveRegistration': haveRegistration,
    'document': document,
    'status': status,
    'createdAt': createdAt,
    'hotelimages': hotelimages,
    'price':price,
  };

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      type: map['type'] ?? '',
      name: map['name'] ?? '',
      booking: map['booking'] ?? '',
      phonenumber: map['phonenumber'] ?? '',
      email: map['email'] ?? '',
      facilities: List<String>.from(map['facilities'] ?? []),
      pan: map['pan'] ?? '',
      gst: map['gst'] ?? '',
      propertyinformation: map['propertyinformation'] ?? '',
      isOwnedorLeased: map['isOwnedorLeased'] ?? '',
      haveRegistration: map['haveRegistration'] ?? '',
      document: map['document'] ?? '',
      status: map['status'] ?? '',
      createdAt: (map['createdAt'] is Timestamp)
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
      hotelimages: List<String>.from(map['hotelimages'] ?? []),
      price: (map['price']??"")
    );
  }
}
