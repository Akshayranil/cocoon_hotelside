import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:flutter/material.dart';

class PropertyPriceField extends StatelessWidget {
  final TextEditingController pricecontroller;
  const PropertyPriceField({super.key,required this.pricecontroller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: pricecontroller,
      decoration: InputDecoration(
        label: Text('Enter your Hotel Price'),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.primary, width: 2),
        ),
        hintText: 'Hotel Price',
      ),
    );
  }
}
