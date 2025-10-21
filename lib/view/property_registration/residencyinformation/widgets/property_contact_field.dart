import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HotelContactField extends StatelessWidget {
  final TextEditingController contactcontroller;
  const HotelContactField({super.key, required this.contactcontroller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.primary, width: 2),
            ),
            hintText: 'Contact number',
          ),
        ),
      ],
    );
  }
}
