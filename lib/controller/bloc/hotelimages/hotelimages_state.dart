import 'package:equatable/equatable.dart';

class HotelImagesState extends Equatable {
  final List<String> imageUrls;
  final bool isLoading;

  const HotelImagesState({
    this.imageUrls = const [],
    this.isLoading = false,
  });

  HotelImagesState copyWith({
    List<String>? imageUrls,
    bool? isLoading,
  }) {
    return HotelImagesState(
      imageUrls: imageUrls ?? this.imageUrls,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [imageUrls, isLoading];
}
