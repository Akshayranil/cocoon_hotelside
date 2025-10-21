import 'package:flutter/material.dart';

class FinancePropertyInformationField extends StatelessWidget {
  final TextEditingController informationcontroller;
  const FinancePropertyInformationField({super.key,required this.informationcontroller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: TextFormField(
        controller: informationcontroller,
        decoration: InputDecoration(
          label: Text('Enter Property Information'),
          hintText: 'Property Information',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
