import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/utilities/customnavigationscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Vertical center
          children: [
            // Replace with your own asset image file
            Image.asset(
              'assets/searchng.jpg', // Ensure this image is in your assets folder
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 24), // Spacing between image and text
            Text(
              "Yay!! Our team is verifying your hotel. Please wait a moment!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            context.read<HotelregistrationBloc>().add(
              SubmitHotelRegistration(),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CustomNavigationscreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColor.ternary,
            backgroundColor: AppColor.primary,
          ),
          child: Text('Next'),
        ),
      ),
    );
  }
}
