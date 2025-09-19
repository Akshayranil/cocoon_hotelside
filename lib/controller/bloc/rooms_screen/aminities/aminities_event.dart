part of 'aminities_bloc.dart';

sealed class AminitiesEvent {}

class AddAminities extends AminitiesEvent {
  final String aminities;
  final String hotelId;
  AddAminities(this.aminities,this.hotelId);
  
}

class LoadAminities extends AminitiesEvent {
  final String hotelId;
  
  LoadAminities(this.hotelId);
}
