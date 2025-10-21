import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OwnedorleasedRadioButton extends StatelessWidget {
  const OwnedorleasedRadioButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Property Information',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              'Is your property owned or leased',
              style: TextStyle(fontSize: 16),
            ),
          ),
          BlocBuilder<HotelregistrationBloc, HotelregistrationState>(
            builder: (context, state) {
              return Column(
                children: [
                  RadioListTile<String>(
                    title: Text("Owned"),
                    value: "owned",
                    groupValue: state.isOwnedorLeased,
                    onChanged: (value) {
                      context.read<HotelregistrationBloc>().add(
                        UpdatedOwnedorLeased(value!),
                      );
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Leased"),
                    value: "leased",
                    groupValue: state.isOwnedorLeased,
                    onChanged: (value) {
                      context.read<HotelregistrationBloc>().add(
                        UpdatedOwnedorLeased(value!),
                      );
                    },
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 20),
          Text('Do you have registration?', style: TextStyle(fontSize: 16)),
          BlocBuilder<HotelregistrationBloc, HotelregistrationState>(
            builder: (context, state) {
              return Column(
                children: [
                  RadioListTile<String>(
                    title: Text("Yes"),
                    value: "yes",
                    groupValue: state.haveRegistration,
                    onChanged: (value) {
                      context.read<HotelregistrationBloc>().add(
                        UpdatedHaveRegistration(value!),
                      );
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("No"),
                    value: "no",
                    groupValue: state.haveRegistration,
                    onChanged: (value) {
                      context.read<HotelregistrationBloc>().add(
                        UpdatedHaveRegistration(value!),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
