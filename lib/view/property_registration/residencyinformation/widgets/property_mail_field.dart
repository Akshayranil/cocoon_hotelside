import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:flutter/material.dart';

class PropertyMailField extends StatelessWidget {
  final TextEditingController emailcontroller;
  const PropertyMailField({super.key,required this.emailcontroller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailcontroller,
      decoration: InputDecoration(
        label: Text('Enter your mail'),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.primary, width: 2),
        ),
        hintText: 'Email',
      ),
    );
  }
}
