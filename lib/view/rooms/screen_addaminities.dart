import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_event.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_state.dart';
import 'package:cocoon_hotelside/view/rooms/screen_uploadimagesflow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmenitiesScreen extends StatelessWidget {
  final String hotelId;
  final String roomId;

  const AmenitiesScreen({super.key, required this.hotelId, required this.roomId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Amenities")),
      body: BlocBuilder<AddpropertiesBloc, AddpropertiesState>(
        builder: (context, state) {
          return state.room.aminities.isEmpty
              ? const Center(child: Text("No amenities added yet"))
              : ListView.builder(
                  itemCount: state.room.aminities.length,
                  itemBuilder: (context, index) {
                    final amenity = state.room.aminities[index];
                    return ListTile(
                      title: Text(amenity),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<AddpropertiesBloc>().add(RemoveAmenity(amenity));
                        },
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddAmenityDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () async {
            Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => BlocProvider.value(
      value: context.read<AddpropertiesBloc>(), // reuse existing instance
      child: RoomImagesFlow(
        hotelId: hotelId,
        roomId: context.read<AddpropertiesBloc>().state.room.roomId,
      ),
    ),
  ),
);
          },
          child: const Text("Next"),
        ),
      ),
    );
  }

  void _showAddAmenityDialog(BuildContext parentContext) {
    final TextEditingController amenityController = TextEditingController();

    showDialog(
      context: parentContext,
      builder: (dialogcontext) => AlertDialog(
        title: const Text("Add Amenity"),
        content: TextField(
          controller: amenityController,
          decoration: const InputDecoration(
            hintText: "Enter amenity",
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogcontext),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              final text = amenityController.text.trim();
              if (text.isNotEmpty) {
                parentContext.read<AddpropertiesBloc>().add(AddAmenity(text));
                Navigator.pop(dialogcontext);
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
