import 'package:flutter/material.dart';

class FinancePanField extends StatelessWidget {
  final TextEditingController pancontroller;
  const FinancePanField({super.key,required this.pancontroller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: pancontroller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          label: Text('Enter PAN Details'),
          hintText: 'PAN Details',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
