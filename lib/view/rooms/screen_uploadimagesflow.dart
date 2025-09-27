import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_bloc.dart';
import 'package:cocoon_hotelside/view/rooms/screen_uploadimages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomImagesFlow extends StatelessWidget {
  final String hotelId;
  final String roomId;

  const RoomImagesFlow({
    super.key,
    required this.hotelId,
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    return  RoomImagesScreen(
        hotelId: hotelId,
        roomId: roomId,
     
    );
  }
}
