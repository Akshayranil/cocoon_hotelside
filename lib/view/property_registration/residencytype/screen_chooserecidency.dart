import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/selection/selection_cubit.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/property_registration/residencyinformation/property_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class TypeofRecidency extends StatelessWidget {
  const TypeofRecidency({super.key});

  

  final List<String> residencyOption = const [
    "Hotels",
    "Bungalow",
    "Dormitory",
    "Resort",
    "Appartment",
    "Villa",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(
        255,
        124,
        125,
        123,
      ).withValues(alpha: 2.6),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'What you like to list?',
                style: TextStyle(
                  color: AppColor.secondary,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: BlocBuilder<SelectionCubit, String?>(
                builder: (context, selectedOption) {
                  return Column(
                    children: residencyOption.map((option) {
                      return Padding(
                        padding: EdgeInsets.all(15),
                        child: ChoiceChip(
                          label: Text(
                            option,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColor.ternary,
                            ),
                          ),
                          selected: selectedOption == option,
                          onSelected: (_) {
                            context.read<SelectionCubit>().select(option);
                          },
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          showCheckmark: false,
                          checkmarkColor: AppColor.ternary,
                          selectedColor: AppColor.secondary,
                          backgroundColor: Colors.grey.withValues(alpha: 0.8),
                          labelPadding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.3,
                            vertical: 10,
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            final selectedOption = context.read<SelectionCubit>().state;
            if (selectedOption != null) {
              context.read<HotelregistrationBloc>().add(
                UpdatedResidencyType(selectedOption),
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PropertyInformation()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Please select a residency type"),backgroundColor: Colors.red,),
              );
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary),
          child: Text(
            'Next',
            style: TextStyle(
              color: AppColor.ternary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
