import 'dart:io';
import 'package:cocoon_hotelside/controller/bloc/hotelimages/hotelimages_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/hotelimages/hotelimages_event.dart';
import 'package:cocoon_hotelside/controller/bloc/hotelimages/hotelimages_state.dart';
import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
import 'package:cocoon_hotelside/utilities/custom_claudinary.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/property_registration/propertyverification/screen_finalverification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class HotelImagesScreen extends StatelessWidget {
  final bool isEditing;
  const HotelImagesScreen({super.key, this.isEditing = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelImagesBloc, HotelImagesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("Hotel Images")),
          body: state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : state.imageUrls.isEmpty
              ? const Center(child: Text("Please upload images"))
              : GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: state.imageUrls.length,
                  itemBuilder: (context, index) {
                    final imageUrl = state.imageUrls[index];
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: Image.network(imageUrl, fit: BoxFit.cover),
                        ),
                        // ✅ Delete button overlay
                        Positioned(
                          top: 4,
                          right: 4,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                              
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 14,
                              ),
                              onPressed: () {
                                _confirmDelete(context, index, imageUrl);
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final hotelbloc = context.read<HotelregistrationBloc>();
              final picker = ImagePicker();
              final pickedFiles = await picker.pickMultiImage();

              if (pickedFiles != null && pickedFiles.isNotEmpty) {
                final images = pickedFiles
                    .map((file) => File(file.path))
                    .toList();

                // List to store uploaded URLs
                List<String> uploadedUrls = [];

                for (var file in images) {
                  final fileurl = await hotelimageuploadToCloudinary(file);
                  if (fileurl != null) {
                    uploadedUrls.add(fileurl);
                  }
                }

                if (uploadedUrls.isNotEmpty) {
                  // Update hotel registration BLoC
                  hotelbloc.add(UpdatedHotelImages(uploadedUrls));
                  // Update local Bloc for UI
                  context.read<HotelImagesBloc>().add(
                    UploadHotelImages(images),
                  );
                }
              }
            },
            backgroundColor: AppColor.primary,
            foregroundColor: AppColor.secondary,
            child: const Icon(Icons.add_a_photo),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                if (isEditing) {
                  Navigator.pop(context);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalVerificationScreen(),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColor.ternary,
                backgroundColor: AppColor.primary,
              ),
              child:  Text(isEditing?"Save changes":"Next"),
            ),
          ),
        );
      },
    );
  }

  // ✅ Confirm before deleting
  void _confirmDelete(BuildContext context, int index, String url) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Image?"),
        content: const Text("Are you sure you want to remove this image?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              // Remove from HotelImagesBloc
              context.read<HotelImagesBloc>().add(DeleteHotelImage(index));
              // Remove from HotelregistrationBloc
              final hotelBloc = context.read<HotelregistrationBloc>();
              final updatedList = List<String>.from(hotelBloc.state.hotelimages)
                ..removeAt(index);
              hotelBloc.add(UpdatedHotelImages(updatedList));
              Navigator.pop(context);
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
