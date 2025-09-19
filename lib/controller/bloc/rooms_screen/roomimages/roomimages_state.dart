import 'package:equatable/equatable.dart';

class RoomImagesState extends Equatable {
  final List<String> imageUrls; // Firebase URLs
  final bool isLoading;

  const RoomImagesState({
    this.imageUrls = const [],
    this.isLoading = false,
  });

  RoomImagesState copyWith({
    List<String>? imageUrls,
    bool? isLoading,
  }) {
    return RoomImagesState(
      imageUrls: imageUrls ?? this.imageUrls,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [imageUrls, isLoading];
}
