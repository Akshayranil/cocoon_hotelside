import 'dart:io';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomimages/roomimages_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomimages/roomimages_event.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomimages/roomimages_state.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/rooms/screen_rooms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RoomImagesScreen extends StatelessWidget {
  const RoomImagesScreen({super.key});
  final hotelId = "your_saved_hotel_id";
  Future<List<File>> pickImages() async {
    final pickedList = await ImagePicker().pickMultiImage();
    return pickedList.map((xfile) => File(xfile.path)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RoomImagesBloc()..add(LoadRoomImages()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Room Images")),
        body: BlocBuilder<RoomImagesBloc, RoomImagesState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.imageUrls.isEmpty) {
              return const Center(child: Text("Upload images here"));
            }

            return GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: state.imageUrls.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return Image.network(state.imageUrls[index], fit: BoxFit.cover);
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: AppColor.secondary,
          backgroundColor: AppColor.primary,
          onPressed: () async {
            final files = await pickImages(); // now returns multiple images
            if (files.isNotEmpty) {
              for (var file in files) {
                context.read<RoomImagesBloc>().add(UploadRoomImage(file));
              }
            }
          },
          child: const Icon(Icons.upload),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => RoomsScreen(hotelId: hotelId),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColor.ternary,
              backgroundColor: AppColor.primary,
            ),
            child: Text('Save Uploads'),
          ),
        ),
      ),
    );
  }
}
