import 'package:cocoon_hotelside/controller/bloc/checkbox/checkbox_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/onboarding/propertyregistration/screen_financelegal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenPolicy extends StatelessWidget {
  final List<String> items = [
    "Free cancellation upto 24 hours",
    "Couple Friendly",
    "Parking Facility",
    "Pets not allowed",
    "Free Wifi",
    "Swimming Pool/Gym/Spa",
  ];
  ScreenPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select the policies you want to implement',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: BlocBuilder<CheckboxBloc, CheckboxState>(
                builder: (context, state) {
                  List<bool> checkedlist = [];
                  if (state is CheckboxInitial) { 
                    checkedlist = state.ischecked;
                  } else if (state is Ischecked) {
                    checkedlist = state.ischecked;
                  }
                  return Column(
                    children: List.generate(items.length, (index) {
                      return CheckboxListTile(
                        checkColor: AppColor.ternary,
                        activeColor: AppColor.primary,
                        title: Text(
                          items[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        value: checkedlist[index],
                        onChanged: (_) {
                          context.read<CheckboxBloc>().add(
                            SelectCheckBox(index),
                          );
                        },
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
  // Get selected policies from CheckboxBloc
  final state = context.read<CheckboxBloc>().state;

  List<String> selectedPolicies = [];
  if (state is Ischecked) {
    for (int i = 0; i < state.ischecked.length; i++) {
      if (state.ischecked[i]) {
        selectedPolicies.add(items[i]); // items[i] = policy text
      }
    }
  }
  if (selectedPolicies.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please select at least one policy'),
        backgroundColor: Colors.red,
      ),
    );
    return; // Stop navigation
  }
  // Send to HotelregistrationBloc
  context.read<HotelregistrationBloc>().add(UpdatedFacilities(selectedPolicies));

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => FinanceandPolicy()),
  );
}
,
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
