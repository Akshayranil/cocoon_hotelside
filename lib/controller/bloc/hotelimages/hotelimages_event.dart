import 'dart:io';

abstract class HotelImagesEvent {}

class LoadHotelImages extends HotelImagesEvent {}

class UploadHotelImages extends HotelImagesEvent {
  final List<File> images;
  UploadHotelImages(this.images);
}
