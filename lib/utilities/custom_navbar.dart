import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, 
      child: Scaffold(
        bottomNavigationBar: Container(
          color: AppColor.primary,
          height: 70,
          child: TabBar(tabs: [
            Tab(icon: Icon(Icons.dashboard),text: 'DashBoard',),
            Tab(icon: Icon(Icons.bookmark_add_sharp),text: 'Booked',),
            Tab(icon: Icon(Icons.meeting_room),text: 'Rooms',),
            Tab(icon: Icon(Icons.person),text: 'Profile',),
            
          ],
          indicatorColor: AppColor.secondary,
          labelColor: AppColor.ternary,
          unselectedLabelColor: Colors.grey,),
          
        ),
        body: TabBarView(children: [
             
        ]),
      ));
  }
}
