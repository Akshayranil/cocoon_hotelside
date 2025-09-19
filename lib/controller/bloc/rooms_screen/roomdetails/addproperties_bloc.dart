import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_event.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddpropertiesBloc extends Bloc<AddpropertiesEvent, AddpropertiesState> {
  AddpropertiesBloc() : super(const AddpropertiesState()) {
    on<UpdateRoomArea>((event, emit) {
      emit(state.copyWith(area: event.area));
    });

    on<UpdateAccommodationType>((event, emit) {
      emit(state.copyWith(accommodationType: event.type));
    });

    on<UpdatePropertySize>((event, emit) {
      emit(state.copyWith(propertySize: event.size));
    });

    on<UpdateExtraBedType>((event, emit) {
      emit(state.copyWith(extraBedType: event.bedType));
    });

    on<UpdateRoomPrice>((event, emit) {
      emit(state.copyWith(roomPrice: event.roomPrice));
    });

    on<UpdatedExtraPersons>((event, emit) {
      emit(state.copyWith(extraPersons: event.extraPersons));
    });

    on<SubmitRoomForm>((event, emit) async {
      emit(state.copyWith(submitted: true));
      try {
        final firestore = FirebaseFirestore.instance;
        await firestore
            .collection('hotelregistration')
            .doc(hotelId)
            .collection('propertydetails')
            .add({
              'area':state.area,
              'type':state.accommodationType,
              'propertysize':state.propertySize,
              'extrabedtype':state.extraBedType,
              'roomprice':state.roomPrice,
              'extrapersons':state.extraPersons,
              'createdAt':FieldValue.serverTimestamp()

            });
        log('Property details added successfully');
      } catch (e) {
        log("Error in saving :$e");
      }
    });
  }
}
