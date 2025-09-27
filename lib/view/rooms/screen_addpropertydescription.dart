import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_event.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_state.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/rooms/screen_addaminities.dart';
import 'package:cocoon_hotelside/view/rooms/screen_addaminitiesflow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPropertyScreen extends StatelessWidget {
  final String uid;
  final String hotelId;
  final String roomId;
  const AddPropertyScreen({super.key, required this.uid,required this.hotelId,required this.roomId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Property Description")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<AddpropertiesBloc, AddpropertiesState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Room Area
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Room Area (sq.ft)",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      final area = int.tryParse(value) ?? 0;
                      context.read<AddpropertiesBloc>().add(
                        UpdateRoomArea(area),
                      );
                    },
                  ),

                  // Accommodation Type
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: DropdownButtonFormField<String>(
                      value: state.room.type,
                      items: ["Single", "Double", "Couple", "Family", "Other"]
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (value) => context
                          .read<AddpropertiesBloc>()
                          .add(UpdateAccommodationType(value!)),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Accommodation Type",
                      ),
                    ),
                  ),

                  // Property Size
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: "Property Size",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        final size = int.tryParse(value) ?? 0;
                        context.read<AddpropertiesBloc>().add(
                          UpdatePropertySize(size),
                        );
                      },
                    ),
                  ),

                  // Extra Bed Type
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: DropdownButtonFormField<String>(
                      value: state.room.extraBedType,
                      items: ["Standard Bed", "Extra Bed"]
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (value) => context
                          .read<AddpropertiesBloc>()
                          .add(UpdateExtraBedType(value!)),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Extra Bed Type",
                      ),
                    ),
                  ),

                  // Room Price
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Room Price (\$)",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        final price = int.tryParse(value) ?? 0;
                        context.read<AddpropertiesBloc>().add(
                          UpdateRoomPrice(price),
                        );
                      },
                    ),
                  ),

                  // Extra Persons Allowed
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Number of Extra Persons Allowed",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        final persons = int.tryParse(value) ?? 0;
                        context.read<AddpropertiesBloc>().add(
                          UpdateExtraPersons(persons),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            // Navigate to AmenitiesScreen using the **same Bloc**
            // In AddPropertyScreen when navigating:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context
                      .read<AddpropertiesBloc>(), // reuse existing instance
                  child: AddAmenityFlow(
                    hotelId: uid,
                    roomId: context.read<AddpropertiesBloc>().state.room.roomId,
                  ),
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColor.ternary,
            backgroundColor: AppColor.primary,
          ),
          child: const Text("Next"),
        ),
      ),
    );
  }
}
