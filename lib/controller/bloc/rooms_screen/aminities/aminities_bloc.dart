import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';

part 'aminities_event.dart';
part 'aminities_state.dart';

class AminitiesBloc extends Bloc<AminitiesEvent, AminitiesState> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  AminitiesBloc() : super(AminitiesInitial()) {
    on<AddAminities>(onaddAminity);
    on<LoadAminities>(onloadAminity);
  }

  FutureOr<void> onaddAminity(
    AddAminities event,
    Emitter<AminitiesState> emit,
  ) async {
    try {
      await firestore
          .collection('hotelregistration')
          .doc(hotelId)
          .collection('aminities')
          .add({'name': event.aminities});
      add(LoadAminities(hotelId));
    } catch (e) {
      emit(ErrorAminityState(e.toString()));
    }
  }

  FutureOr<void> onloadAminity(
    LoadAminities event,
    Emitter<AminitiesState> emit,
  ) async {
    emit(LoadingAminityState());
    try {
      final snapshot = await firestore
          .collection('hotelregistration')
          .doc(event.hotelId)
          .collection('aminities')
          .get();

      final aminities = snapshot.docs
          .map((doc) => doc['name'] as String)
          .toList();
      emit(LoadedAminityState(aminities));
    } catch (e) {
      emit(ErrorAminityState(e.toString()));
    }
  }
}
