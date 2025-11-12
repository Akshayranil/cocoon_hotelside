import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/utilities/customnavigationscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HotelregistrationBloc, HotelregistrationState>(
      listener: (context, state) {
        if (state.hotelId.isNotEmpty) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CustomNavigationscreen(hotelId: state.hotelId),
            ),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/searchng.jpg',
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 24),
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
              // trigger hotel registration
              context
                  .read<HotelregistrationBloc>()
                  .add(SubmitHotelRegistration());
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColor.ternary,
              backgroundColor: AppColor.primary,
            ),
            child: Text('Next'),
          ),
        ),
      ),
    );
  }
}
