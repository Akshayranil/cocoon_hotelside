import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_event.dart';
import 'package:cocoon_hotelside/view/rooms/screen_addpropertydescription.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPropertyFlow extends StatelessWidget {
  final String hotelId;
  final String? roomId; // Nullable - null means creating new room

  const AddPropertyFlow({
    super.key,
    required this.hotelId,
    this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    // Generate new roomId only if not provided (creating new)
    final effectiveRoomId = roomId ??
        FirebaseFirestore.instance
            .collection('hotelregistration')
            .doc(hotelId)
            .collection('rooms')
            .doc()
            .id;

    return BlocProvider<AddpropertiesBloc>(
      create: (_) {
        final bloc = AddpropertiesBloc(effectiveRoomId,FirebaseFirestore.instance);

        // ✅ If roomId provided, load existing data
        if (roomId != null) {
          bloc.add(LoadExistingRoom(hotelId: hotelId, roomId: roomId!));
        }

        return bloc;
      },
      child: Builder(
        builder: (context) {
          return AddPropertyScreen(
            uid: hotelId,
            roomId: effectiveRoomId,
            hotelId: hotelId,
          );
        },
      ),
    );
  }
}
