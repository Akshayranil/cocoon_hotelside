
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_event.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AddpropertiesBloc extends Bloc<AddpropertiesEvent, AddpropertiesState> {
  AddpropertiesBloc(String roomId) : super(AddpropertiesState.initial(roomId)) {
    on<UpdateRoomArea>((event, emit) {
      emit(state.copyWith(room: state.room.copyWith(area: event.area)));
    });

    on<UpdateAccommodationType>((event, emit) {
      emit(state.copyWith(room: state.room.copyWith(type: event.type)));
    });

    on<UpdatePropertySize>((event, emit) {
      emit(state.copyWith(room: state.room.copyWith(size: event.size)));
    });

    on<UpdateExtraBedType>((event, emit) {
      emit(
        state.copyWith(
          room: state.room.copyWith(extraBedType: event.extraBedType),
        ),
      );
    });

    on<UpdateRoomPrice>((event, emit) {
      emit(
        state.copyWith(room: state.room.copyWith(roomPrice: event.roomPrice)),
      );
    });

    on<UpdateExtraPersons>((event, emit) {
      emit(
        state.copyWith(
          room: state.room.copyWith(extraPersons: event.extraPersons),
        ),
      );
    });

    on<SubmitRoomDetailForm>((event, emit) {
      
    });

    on<AddAmenity>((event, emit) {
  final updatedAmenities = List<String>.from(state.room.aminities)..add(event.amenity);
  emit(state.copyWith(room: state.room.copyWith(aminities: updatedAmenities)));
});

on<RemoveAmenity>((event, emit) {
  final updatedAmenities = List<String>.from(state.room.aminities)..remove(event.amenity);
  emit(state.copyWith(room: state.room.copyWith(aminities: updatedAmenities)));
});

on<AddImage>((event, emit) {
  final updatedImages = List<String>.from(state.room.images)..add(event.imageUrl);
  emit(state.copyWith(room: state.room.copyWith(images: updatedImages)));
});

on<RemoveImage>((event, emit) {
  final updatedImages = List<String>.from(state.room.images)..remove(event.imageUrl);
  emit(state.copyWith(room: state.room.copyWith(images: updatedImages)));
});


  }
}
