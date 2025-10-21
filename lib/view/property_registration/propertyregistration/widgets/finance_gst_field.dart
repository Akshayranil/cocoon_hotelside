import 'package:flutter/material.dart';

class FinanceGstField extends StatelessWidget {
  final TextEditingController gstcontroller;
  const FinanceGstField({super.key,required this.gstcontroller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        controller: gstcontroller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          label: Text('Enter GST Details'),
          hintText: 'GST Details',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
