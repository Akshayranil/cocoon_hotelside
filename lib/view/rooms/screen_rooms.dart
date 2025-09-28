import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/rooms/rooms_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/rooms/rooms_event.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/rooms/rooms_state.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/rooms/screen_addpropertiesflow.dart';
import 'package:cocoon_hotelside/view/rooms/screen_addpropertydescription.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RoomsScreen extends StatelessWidget {
  final String hotelId;

  const RoomsScreen({super.key, required this.hotelId});

  @override
  Widget build(BuildContext context) {
    // Load rooms when screen opens
    context.read<RoomsBloc>().add(LoadRoomsEvent(hotelId));

    return Scaffold(
    
      body: BlocBuilder<RoomsBloc, RoomsState>(
        builder: (context, state) {
          if (state is RoomsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RoomsLoaded) {
            if (state.rooms.isEmpty) {
              return const Center(child: Text("No rooms added"));
            }

             return ListView.builder(
  itemCount: state.rooms.length,
  padding: const EdgeInsets.all(16.0),
  itemBuilder: (context, index) {
    final room = state.rooms[index];
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side → Room info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    room.type ?? "Unnamed Room",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                   room.extraPersons.toString()?? "• Price for 1 Adult",
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  Text(
                    "• Room size: ${room.area ?? "N/A"} sq.ft",
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 6),

                  // Example facilities (make sure to pull from your room model)
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      // _buildFacilityChip("Breakfast included"),
                      // _buildFacilityChip("Free WiFi"),
                      // _buildFacilityChip("Private bathroom"),
                      // _buildFacilityChip("Air conditioning"),
                    ],
                  ),

                  const SizedBox(height: 10),
                  Text(
                    "₹ ${room.roomPrice ?? 0}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "+ taxes and fees",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),

                  const SizedBox(height: 10),
                  Row(
  children: [
    OutlinedButton(
      onPressed: () {
        // Navigate to edit screen with this roomId
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddPropertyFlow(
              hotelId: hotelId,
              roomId: room.roomId,
            ),
          ),
        );
      },
      child: const Text("Edit"),
    ),
    const SizedBox(width: 8),
    OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.red,
        side: const BorderSide(color: Colors.red),
      ),
      onPressed: () async {
        // Confirm before deleting
        final confirm = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Delete Room"),
            content: const Text("Are you sure you want to delete this room?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text("Delete"),
              ),
            ],
          ),
        );

        if (confirm == true) {
          // Firestore delete
          await FirebaseFirestore.instance
              .collection('hotelregistration')
              .doc(hotelId)
              .collection('rooms')
              .doc(room.roomId)
              .delete();

          // Refresh rooms after delete
          // ignore: use_build_context_synchronously
          context.read<RoomsBloc>().add(LoadRoomsEvent(hotelId));
        }
      },
      child: const Text("Delete"),
    ),
  ],
),

                ],
              ),
            ),

            // Right side → Room image
         ClipRRect(
  borderRadius: BorderRadius.circular(8),
  child: Image(
    image: room.images.isNotEmpty
        ? NetworkImage(room.images[0]) // if valid URL exists
        : AssetImage('assets/cocoon.png') as ImageProvider, // fallback
    width: 120,
    height: 100,
    fit: BoxFit.cover,
  ),
),


          ],
        ),
      ),
    );
  },
);

          } else if (state is RoomsError) {
            return Center(child: Text("Error: ${state.message}"));
          }

          return const Center(child: Text("No rooms added"));
        },
      ),
      floatingActionButton: FloatingActionButton(
  backgroundColor: AppColor.primary,
  foregroundColor: AppColor.secondary,
  onPressed: () async{
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final roomId = FirebaseFirestore.instance
        .collection('hotelregistration')
        .doc(hotelId)
        .collection('rooms')
        .doc()
        .id;

  await  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context)  => AddPropertyFlow(
          hotelId:hotelId,
          roomId: roomId,
        ),
          
        
      ),
    );
    context.read<RoomsBloc>().add(LoadRoomsEvent(hotelId));
  },
  child: const Icon(Icons.add),
),

    );
  }
}


// Widget _buildFacilityChip(String text) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//     decoration: BoxDecoration(
//       color: Colors.green.shade50,
//       borderRadius: BorderRadius.circular(6),
//     ),
//     child: Text(
//       text,
//       style: const TextStyle(
//         fontSize: 12,
//         color: Colors.green,
//         fontWeight: FontWeight.w500,
//       ),
//     ),
//   );
// }

