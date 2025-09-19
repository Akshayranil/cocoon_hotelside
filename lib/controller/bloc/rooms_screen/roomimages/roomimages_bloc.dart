import 'dart:io';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomimages/roomimages_event.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomimages/roomimages_state.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RoomImagesBloc extends Bloc<RoomImagesEvent, RoomImagesState> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  RoomImagesBloc() : super(const RoomImagesState()) {
    on<LoadRoomImages>(_onLoadRoomImages);
    on<UploadRoomImage>(_onUploadRoomImage);
  }

  Future<void> _onLoadRoomImages(
      LoadRoomImages event, Emitter<RoomImagesState> emit) async {
    final snapshot = await firestore.collection("rooms").doc("room1").get();

    if (snapshot.exists) {
      final urls = List<String>.from(snapshot.data()?["images"] ?? []);
      emit(state.copyWith(imageUrls: urls));
    }
  }

  Future<void> _onUploadRoomImage(
      UploadRoomImage event, Emitter<RoomImagesState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      final ref = storage
          .ref()
          .child("rooms")
          .child("room1")
          .child(DateTime.now().toString());

      await ref.putFile(event.imageFile);
      final url = await ref.getDownloadURL();

      final updatedList = List<String>.from(state.imageUrls)..add(url);

      await firestore.collection("rooms").doc("room1").set(
        {"images": updatedList},
        SetOptions(merge: true),
      );

      emit(state.copyWith(imageUrls: updatedList, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
