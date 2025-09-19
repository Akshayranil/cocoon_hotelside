import 'package:equatable/equatable.dart';
import 'dart:io';

abstract class RoomImagesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadRoomImages extends RoomImagesEvent {}

class UploadRoomImage extends RoomImagesEvent {
  final File imageFile;
  UploadRoomImage(this.imageFile);

  @override
  List<Object?> get props => [imageFile];
}
