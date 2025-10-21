import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/property_registration/residencyfacilities/screen_policy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertyInformationBottomNavbar extends StatelessWidget {
  final TextEditingController hotelcontroller;
  final TextEditingController datecontroller;
  final TextEditingController contactcontroller;
  final TextEditingController emailcontroller;
  const PropertyInformationBottomNavbar({
    super.key,
    required this.hotelcontroller,
    required this.datecontroller,
    required this.contactcontroller,
    required this.emailcontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {
          // Check if any field is empty
          if (hotelcontroller.text.isEmpty ||
              datecontroller.text.isEmpty ||
              contactcontroller.text.isEmpty ||
              emailcontroller.text.isEmpty) {
            // Show a simple error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Please fill all the fields'),
                backgroundColor: Colors.red,
              ),
            );
            return; // Stop navigation
          }

          // If all fields are filled, proceed
          context.read<HotelregistrationBloc>().add(
            UpdatedResidencyName(hotelcontroller.text),
          );
          context.read<HotelregistrationBloc>().add(
            UpdatedBookingTime(datecontroller.text),
          );
          context.read<HotelregistrationBloc>().add(
            UpdatedContactNumber(contactcontroller.text),
          );
          context.read<HotelregistrationBloc>().add(
            UpdatedEmail(emailcontroller.text),
          );

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScreenPolicy()),
          );
        },

        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.ternary,
        ),
        child: Text('Next'),
      ),
    );
  }
}
