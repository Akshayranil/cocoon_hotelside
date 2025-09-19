import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'hotelregistration_event.dart';
part 'hotelregistration_state.dart';

final hotelDoc = FirebaseFirestore.instance
    .collection('hotelregistration')
    .doc();

String hotelId = hotelDoc.id;

class HotelregistrationBloc
    extends Bloc<HotelregistrationEvent, HotelregistrationState> {
  HotelregistrationBloc() : super(HotelregistrationState()) {
    on<UpdatedResidencyType>(
      (event, emit) => emit(state.copyWith(type: event.type)),
    );
    on<UpdatedResidencyName>(
      (event, emit) => emit(state.copyWith(name: event.name)),
    );
    on<UpdatedBookingTime>(
      (event, emit) => emit(state.copyWith(booking: event.booking)),
    );
    on<UpdatedContactNumber>(
      (event, emit) => emit(state.copyWith(phonenumber: event.phonenumber)),
    );
    on<UpdatedEmail>((event, emit) => emit(state.copyWith(email: event.email)));
    on<UpdatedFacilities>(
      (event, emit) => emit(state.copyWith(facilities: event.facilities)),
    );
    on<UpdatedPan>((event, emit) => emit(state.copyWith(pan: event.pan)));
    on<UpdatedGSTDetails>(
      (event, emit) => emit(state.copyWith(gst: event.gst)),
    );
    on<UpdatedPropertyInformation>(
      (event, emit) =>
          emit(state.copyWith(propertyinformation: event.propertyinformation)),
    );
    on<UpdatedOwnedorLeased>(
      (event, emit) =>
          emit(state.copyWith(isOwnedorLeased: event.isOwnedorLeased)),
    );
    on<UpdatedHaveRegistration>(
      (event, emit) =>
          emit(state.copyWith(haveRegistration: event.haveRegistration)),
    );
    on<UpdatedDocument>(
      (event, emit) => emit(state.copyWith(document: event.document)),
    );
    on<SubmitHotelRegistration>((event, emit) async {
      try {
        await hotelDoc.set({
          'type': state.type,
          'name': state.name,
          'booking': state.booking,
          'phonenumber': state.phonenumber,
          'email': state.email,
          'facilities': state.facilities,
          'pan': state.pan,
          'gst': state.gst,
          'propertyinformation': state.propertyinformation,
          'isOwnedorLeased': state.isOwnedorLeased,
          'haveRegistration': state.haveRegistration,
          'document': state.document,
          'createdAt': FieldValue.serverTimestamp(),
        });
      } catch (e) {
        log("Error submitting documents : $e");
      }
    });
  }
}
