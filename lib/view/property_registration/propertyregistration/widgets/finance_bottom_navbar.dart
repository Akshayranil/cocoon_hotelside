import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/property_registration/propertyimages/screen_propertyimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinanceBottomNavbar extends StatelessWidget {
  final bool isEditing;
  final TextEditingController pancontroller;
  final TextEditingController informationcontroller;
  final TextEditingController gstcontroller;
  const FinanceBottomNavbar({
    super.key,
    required this.informationcontroller,
    required this.gstcontroller,
    required this.pancontroller,
    this.isEditing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: () {
          context.read<HotelregistrationBloc>().add(
            UpdatedPan(pancontroller.text),
          );
          context.read<HotelregistrationBloc>().add(
            UpdatedPropertyInformation(informationcontroller.text),
          );
          context.read<HotelregistrationBloc>().add(
            UpdatedGSTDetails(gstcontroller.text),
          );
          if (isEditing) {
            Navigator.pop(context);
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HotelImagesScreen()),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColor.ternary,
          backgroundColor: AppColor.primary,
        ),
        child: Text(isEditing?"Save changes":"Next"),
      ),
    );
  }
}
