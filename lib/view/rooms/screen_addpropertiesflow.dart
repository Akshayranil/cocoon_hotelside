import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_bloc.dart';
import 'package:cocoon_hotelside/view/rooms/screen_addpropertydescription.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPropertyFlow extends StatelessWidget {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final String hotelId;
  final String roomId;
  AddPropertyFlow({super.key,required this.hotelId,required this.roomId});

  @override
  Widget build(BuildContext context) {
    // Generate roomId once
    final roomId = FirebaseFirestore.instance
        .collection('hotelregistration')
        .doc(uid)
        .collection('rooms')
        .doc()
        .id;

    return BlocProvider<AddpropertiesBloc>(
      create: (_) => AddpropertiesBloc(roomId), // single Bloc for the flow
      child: Builder(
        builder: (context) {
          return AddPropertyScreen(uid: uid,roomId: roomId,hotelId: hotelId,);
        },
      ),
    );
  }
}
