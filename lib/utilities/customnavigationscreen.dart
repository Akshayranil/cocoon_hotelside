// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/bookings/screen_booking.dart';
import 'package:cocoon_hotelside/view/home/screen_home.dart';
import 'package:cocoon_hotelside/view/profile/screen_profile.dart';
import 'package:cocoon_hotelside/view/rooms/screen_rooms.dart';
import 'package:flutter/material.dart';

class CustomNavigationscreen extends StatelessWidget {
  final int? tabindex;
  final String hotelId;
  CustomNavigationscreen({super.key, this.tabindex,required this.hotelId});

 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: tabindex??0,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: AppColor.primary,
          height: MediaQuery.of(context).size.height * 0.08,
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.dashboard), text: "DashBoard"),
              Tab(icon: Icon(Icons.search), text: "Bookings"),
              Tab(icon: Icon(Icons.family_restroom_sharp), text: "Rooms"),
              Tab(icon: Icon(Icons.person), text: "Profile"),
            ],
            labelColor: AppColor.secondary,
            unselectedLabelColor: Color(0xff999999),
          ),
        ),
        body: TabBarView(
          children: [
            HomeScreen(),
            BookingsScreen(),
            RoomsScreen(hotelId: hotelId),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
