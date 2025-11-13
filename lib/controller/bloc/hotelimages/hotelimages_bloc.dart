import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_hotelside/controller/bloc/hotelimages/hotelimages_event.dart';
import 'package:cocoon_hotelside/controller/bloc/hotelimages/hotelimages_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;


class HotelImagesBloc extends Bloc<HotelImagesEvent, HotelImagesState> {
 

  HotelImagesBloc() : super(HotelImagesState()) {
    on<LoadHotelImages>(onLoadHotelImages);
    on<UploadHotelImages>(onUploadHotelImages);
    on<DeleteHotelImage>(onDeleteHotelImage);
  }

  Future<void> onLoadHotelImages(
      LoadHotelImages event, Emitter<HotelImagesState> emit) async {
        final uid = FirebaseAuth.instance.currentUser!.uid;
    final doc = await FirebaseFirestore.instance
        .collection('hotelregistration')
        .doc(uid)
        .get();

    if (doc.exists && doc.data()!.containsKey('images')) {
      emit(state.copyWith(imageUrls: List<String>.from(doc['images'])));
    }
  }

  Future<void> onUploadHotelImages(
      UploadHotelImages event, Emitter<HotelImagesState> emit) async {
    emit(state.copyWith(isLoading: true));

    List<String> uploadedUrls = [];

    for (File image in event.images) {
      final url = Uri.parse(
          "https://api.cloudinary.com/v1_1/dbmzu0vdn/image/upload");

      final request = http.MultipartRequest("POST", url)
        ..fields['upload_preset'] = "hotel_imageupload"
        ..files.add(await http.MultipartFile.fromPath("file", image.path));

      final response = await request.send();
      final resBody = await response.stream.bytesToString();
      final data = json.decode(resBody);

      uploadedUrls.add(data["secure_url"]);
    }

    final updatedImages = List<String>.from(state.imageUrls)..addAll(uploadedUrls);
   final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('hotelregistration')
        .doc(uid)
        .set({'images': updatedImages}, SetOptions(merge: true));

    emit(state.copyWith(imageUrls: updatedImages, isLoading: false));
  }

  Future<void> onDeleteHotelImage(
      DeleteHotelImage event, Emitter<HotelImagesState> emit) async {
    final updatedImages = List<String>.from(state.imageUrls);
    if (event.index >= 0 && event.index < updatedImages.length) {
      updatedImages.removeAt(event.index);

      // Update Firestore
      final uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection('hotelregistration')
          .doc(uid)
          .set({'images': updatedImages}, SetOptions(merge: true));

      // Update state
      emit(state.copyWith(imageUrls: updatedImages));
    }
  }

}
