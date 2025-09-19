import 'package:equatable/equatable.dart';

class AddpropertiesState extends Equatable {
  final String area;
  final String accommodationType;
  final String propertySize;
  final String extraBedType;
  final String roomPrice;
  final String extraPersons;
  final bool submitted;

  const AddpropertiesState({
    this.area = "",
    this.accommodationType = "Single",
    this.propertySize = "",
    this.extraBedType = "Standard Bed",
    this.roomPrice = '',
    this.extraPersons = "",
    this.submitted = false,
  });

  AddpropertiesState copyWith({
    String? area,
    String? accommodationType,
    String? propertySize,
    String? extraBedType,
    String? roomPrice,
    String? extraPersons,
    bool? submitted,
  }) {
    return AddpropertiesState(
      area: area ?? this.area,
      accommodationType: accommodationType ?? this.accommodationType,
      propertySize: propertySize ?? this.propertySize,
      extraBedType: extraBedType ?? this.extraBedType,
      roomPrice: roomPrice ?? this.roomPrice,
      extraPersons: extraPersons ?? this.extraPersons,
      submitted: submitted ?? this.submitted,
    );
  }

  @override
  List<Object?> get props => [area, accommodationType, propertySize, extraBedType,roomPrice, extraPersons, submitted];
}
