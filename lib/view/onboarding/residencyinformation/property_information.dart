import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/onboarding/residencyfacilities/screen_policy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PropertyInformation extends StatelessWidget {
  PropertyInformation({super.key});
  final TextEditingController hotelcontroller = TextEditingController();
  final TextEditingController datecontroller = TextEditingController();
  final TextEditingController contactcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String today = DateFormat('dd-MM-yy').format(DateTime.now());
    datecontroller.text = today;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Basic Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  controller: hotelcontroller,
                  decoration: InputDecoration(
                    label: Text('Enter hotel name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primary, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Hotel Name",
                  ),
                ),
              ),
              Text(
                'Taking Booking Since',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    DateFormat('dd-MM-yy').format(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 20),
                child: Text(
                  'Contact details',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: contactcontroller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // allow only numbers
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: InputDecoration(
                  label: Text('Enter your contact number'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColor.primary, width: 2),
                  ),
                  hintText: 'Contact number',
                ),
              ),

              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 20),
                child: TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    label: Text('Enter your mail'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColor.primary, width: 2),
                    ),
                    hintText: 'Email',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
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
      ),
    );
  }
}
