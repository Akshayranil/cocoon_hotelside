// import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_bloc.dart';
// import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_event.dart';
// import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_state.dart';
// import 'package:cocoon_hotelside/utilities/custom_colors.dart';
// import 'package:cocoon_hotelside/view/rooms/screen_uploadimagesflow.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AmenitiesScreen extends StatelessWidget {
//   final String hotelId;
//   final String roomId;

//   const AmenitiesScreen({super.key, required this.hotelId, required this.roomId});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Amenities")),
//       body: BlocBuilder<AddpropertiesBloc, AddpropertiesState>(
//         builder: (context, state) {
//           return state.room.aminities.isEmpty
//               ? const Center(child: Text("No amenities added yet"))
//               : ListView.builder(
//                   itemCount: state.room.aminities.length,
//                   itemBuilder: (context, index) {
//                     final amenity = state.room.aminities[index];
//                     return ListTile(
//                       title: Text(amenity),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.delete),
//                         onPressed: () {
//                           context.read<AddpropertiesBloc>().add(RemoveAmenity(amenity));
//                         },
//                       ),
//                     );
//                   },
//                 );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _showAddAmenityDialog(context);
//         },
//         backgroundColor: AppColor.primary,
//         child: const Icon(Icons.add),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(10),
//         child: ElevatedButton(
//           onPressed: () async {
//             Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (_) => BlocProvider.value(
//       value: context.read<AddpropertiesBloc>(), // reuse existing instance
//       child: RoomImagesFlow(
//         hotelId: hotelId,
//         roomId: context.read<AddpropertiesBloc>().state.room.roomId,
//       ),
//     ),
//   ),
// );
//           },
//           style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary,foregroundColor: AppColor.ternary),
//           child: const Text("Next"),
//         ),
//       ),
//     );
//   }

//   void _showAddAmenityDialog(BuildContext parentContext) {
//     final TextEditingController amenityController = TextEditingController();

//     showDialog(
//       context: parentContext,
//       builder: (dialogcontext) => AlertDialog(
//         title: const Text("Add Amenity"),
//         content: TextField(
//           controller: amenityController,
//           decoration: const InputDecoration(
//             hintText: "Enter amenity",
//             border: OutlineInputBorder(),
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(dialogcontext),
//             child: const Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final text = amenityController.text.trim();
//               if (text.isNotEmpty) {
//                 parentContext.read<AddpropertiesBloc>().add(AddAmenity(text));
//                 Navigator.pop(dialogcontext);
//               }
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColor.primary,
//               foregroundColor: AppColor.ternary
//             ),
//             child: const Text("Add"),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_event.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_state.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/rooms/screen_uploadimagesflow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmenitiesScreen extends StatelessWidget {
  final String hotelId;
  final String roomId;

  const AmenitiesScreen({
    super.key,
    required this.hotelId,
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Amenities"),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('aminities').get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No amenities available'));
          }

          final allAmenities = snapshot.data!.docs;
          return BlocBuilder<AddpropertiesBloc, AddpropertiesState>(
            builder: (context, state) {
              final selectedAmenities = state.room.aminities; // list of selected amenity IDs

              return ListView.builder(
                itemCount: allAmenities.length,
                itemBuilder: (context, index) {
                  final doc = allAmenities[index];
                  final id = doc.id;
                  final name = doc['name'] ?? 'Unnamed';

                  final isSelected = selectedAmenities.contains(id);

                  return CheckboxListTile(
                    value: isSelected,
                    title: Text(name),
                    onChanged: (bool? value) {
                      if (value == true) {
                        context.read<AddpropertiesBloc>().add(AddAmenity(id));
                      } else {
                        context.read<AddpropertiesBloc>().add(RemoveAmenity(id));
                      }
                    },
                  );
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<AddpropertiesBloc>(), // reuse existing bloc
                  child: RoomImagesFlow(
                    hotelId: hotelId,
                    roomId: context.read<AddpropertiesBloc>().state.room.roomId,
                  ),
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primary,
            foregroundColor: AppColor.ternary,
          ),
          child: const Text("Next"),
        ),
      ),
    );
  }
}

