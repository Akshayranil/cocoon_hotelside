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
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          room.roomId ?? "Unnamed Room",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Type: ${room.type ?? "N/A"}",
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey),
                        ),
                        if (room.area != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            "Area: ${room.area} sq.ft",
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                        ],
                        if (room.roomPrice != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            "Price: \$${room.roomPrice}",
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                        ],
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
