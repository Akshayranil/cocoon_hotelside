import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_event.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/roomdetails/addproperties_state.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/rooms/screen_addaminities.dart';
import 'package:cocoon_hotelside/view/rooms/screen_uploadimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPropertyScreen extends StatelessWidget {
  const AddPropertyScreen({super.key});

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
                    onChanged: (value) => context.read<AddpropertiesBloc>().add(
                      UpdateRoomArea(value),
                    ),
                  ),
                 

                  // Accommodation Type
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: DropdownButtonFormField<String>(
                      value: state.accommodationType,
                      items: ["Single", "Double", "Couple", "Family", "Other"]
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) => context.read<AddpropertiesBloc>().add(
                        UpdateAccommodationType(value!),
                      ),
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
                      onChanged: (value) => context.read<AddpropertiesBloc>().add(
                        UpdatePropertySize(value),
                      ),
                    ),
                  ),
                  

                  // Extra Bed Type
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: DropdownButtonFormField<String>(
                      value: state.extraBedType,
                      items: ["Standard Bed", "Extra Bed"]
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) => context.read<AddpropertiesBloc>().add(
                        UpdateExtraBedType(value!),
                      ),
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
                      onChanged: (value) => context.read<AddpropertiesBloc>().add(
                        UpdateRoomPrice(value),
                      ),
                    ),
                  ),
                  

                  // Number of Extra Persons Allowed
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Number of Extra Persons Allowed",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => context.read<AddpropertiesBloc>().add(
                        UpdatedExtraPersons(value),
                      ),
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
            context.read<AddpropertiesBloc>().add(SubmitRoomForm());
            // You can now send state data to Firebase using RoomsBloc
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AmenitiesScreen(hotelId: hotelId,)),
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
