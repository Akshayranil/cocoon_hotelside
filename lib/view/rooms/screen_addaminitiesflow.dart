import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_bloc.dart';
import 'package:cocoon_hotelside/view/rooms/screen_addaminities.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAmenityFlow extends StatelessWidget {
  final String hotelId;
  final String roomId;
  
  const AddAmenityFlow({super.key, required this.hotelId, required this.roomId});

  @override
  Widget build(BuildContext context) {
    return  AmenitiesScreen(hotelId: hotelId, roomId: roomId);
    
  }
}
