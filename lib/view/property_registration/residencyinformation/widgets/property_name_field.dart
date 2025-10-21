import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:flutter/material.dart';

class HotelNameField extends StatelessWidget {
  final TextEditingController hotelcontroller;
  const HotelNameField({super.key, required this.hotelcontroller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Basic Information',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            controller: hotelcontroller,
            decoration: InputDecoration(
              label: Text('Enter hotel name'),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primary, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Hotel Name",
            ),
          ),
        ),
      ],
    );
  }
}
