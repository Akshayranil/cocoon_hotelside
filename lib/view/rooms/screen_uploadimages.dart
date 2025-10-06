import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_event.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_state.dart';
import 'package:cocoon_hotelside/utilities/custom_claudinary.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/utilities/customnavigationscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RoomImagesScreen extends StatelessWidget {
  final String hotelId;
  final String roomId;

  const RoomImagesScreen({
    super.key,
    required this.hotelId,
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Room Images")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<AddpropertiesBloc, AddpropertiesState>(
          builder: (context, state) {
            return state.room.images.isEmpty
                ? const Center(child: Text("No images added yet"))
                : ListView.builder(
                    itemCount: state.room.images.length,
                    itemBuilder: (context, index) {
                      final imageUrl = state.room.images[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: Image.network(
                            imageUrl,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          title: Text("Image ${index + 1}"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              context.read<AddpropertiesBloc>().add(
                                RemoveImage(imageUrl),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),

floatingActionButton: FloatingActionButton(
  onPressed: () async {
    final hotelbloc = context.read<AddpropertiesBloc>();
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      // Upload each image one by one and add to Bloc
      for (var file in pickedFiles) {
        final fileUrl = await roomimageuploadToCloudinary(File(file.path));
        if (fileUrl != null) {
          hotelbloc.add(AddImage(fileUrl)); // Add each uploaded image URL
        }
      }
    }
  },
  backgroundColor: AppColor.primary,
  child: const Icon(Icons.add_a_photo),
),


      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () async {
            final state = context.read<AddpropertiesBloc>().state;

            await FirebaseFirestore.instance
                .collection('hotelregistration')
                .doc(hotelId)
                .collection('rooms')
                .doc(roomId)
                .set(state.room.toMap());

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CustomNavigationscreen(hotelId: hotelId,tabindex: 2,)),
            );
          },style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary,foregroundColor: AppColor.ternary),

          child: const Text("Finish"),
        ),
      ),
    );
  }
}
