import 'dart:io';
import 'package:cocoon_hotelside/controller/bloc/hotelimages/hotelimages_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/hotelimages/hotelimages_event.dart';
import 'package:cocoon_hotelside/controller/bloc/hotelimages/hotelimages_state.dart';
import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
import 'package:cocoon_hotelside/utilities/custom_claudinary.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/onboarding/propertyverification/screen_finalverification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class HotelImagesScreen extends StatelessWidget {
  const HotelImagesScreen({super.key});

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
                    return Image.network(
                      state.imageUrls[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final hotelbloc = context.read<HotelregistrationBloc>();
              final picker = ImagePicker();
              final pickedFiles = await picker.pickMultiImage();

              if (pickedFiles.isNotEmpty) {
                final images = pickedFiles
                    .map((file) => File(file.path))
                    .toList();

                // List to store all uploaded URLs
                List<String> uploadedUrls = [];

                for (var file in images) {
                  final fileurl = await hotelimageuploadToCloudinary(file);
                  if (fileurl != null) {
                    uploadedUrls.add(fileurl);
                  }
                }

                // Dispatch event with all uploaded URLs
                if (uploadedUrls.isNotEmpty) {
                  hotelbloc.add(UpdatedHotelImages(uploadedUrls));
                }

                // Pass all selected images (if needed for UI)
                context.read<HotelImagesBloc>().add(UploadHotelImages(images));
              }
            },backgroundColor: AppColor.primary,
            foregroundColor: AppColor.secondary,
            
            child: const Icon(Icons.add_a_photo,),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FinalVerificationScreen(),
                  ),
                );
              },style: ElevatedButton.styleFrom(
                foregroundColor: AppColor.ternary,
                backgroundColor: AppColor.primary
              ),
              child: Text('Next'),
            ),
          ),
        );
      },
    );
  }
}
