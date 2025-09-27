import 'package:cocoon_hotelside/model/room_model.dart';
import 'package:equatable/equatable.dart';

class AddpropertiesState extends Equatable {
  final Room room; // single object to hold all data
  final bool isValid;
  final String? errorMessage;

  const AddpropertiesState({required this.room,this.isValid=false,this.errorMessage});

  factory AddpropertiesState.initial(String roomId) {
    return AddpropertiesState(
      room: Room(
        roomId: roomId,
        area: 0,
        type: 'Single',
        size: 0,
        extraBedType: 'Standard Bed',
        roomPrice: 0,
        extraPersons: 0,
        aminities: [],
        images: [],
      ),
    );
  }

  AddpropertiesState copyWith({Room? room,bool? isValid,String ? errorMessage}) {
    return AddpropertiesState(room: room ?? this.room,isValid: isValid??this.isValid,errorMessage: errorMessage??this.errorMessage);
  }

  @override
  List<Object?> get props => [room,isValid,errorMessage??""];
}
