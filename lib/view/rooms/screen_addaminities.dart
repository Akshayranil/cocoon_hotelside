import 'package:cocoon_hotelside/controller/bloc/rooms_screen/aminities/aminities_bloc.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/rooms/screen_uploadimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AmenitiesScreen extends StatelessWidget {
  final String hotelId;
  AmenitiesScreen({super.key, required this.hotelId});
  TextEditingController amenitycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AminitiesBloc, AminitiesState>(
        builder: (context, state) {
          if (state is LoadingAminityState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadedAminityState) {
            if (state.aminities.isEmpty) {
              return Center(child: Text('Add Aminities'));
            }
            return ListView.builder(
              itemCount: state.aminities.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(state.aminities[index],style: TextStyle(),));
              },
            );
          } else if (state is ErrorAminityState) {
            return Center(child: Text('Error : ${state.message}'));
          }
          return Center(child: Text('Add aminities'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Amenities'),
                content: TextField(
                  controller: amenitycontroller,
                  decoration: InputDecoration(
                    label: Text('Enter amenities'),
                    hintText: 'eg:Free Wifi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String aminities = amenitycontroller.text.trim();
                      if (aminities.isNotEmpty) {
                        context.read<AminitiesBloc>().add(
                          AddAminities(aminities, hotelId),
                        );
                      }
                      Navigator.pop(context);
                      amenitycontroller.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColor.ternary,
                      backgroundColor: AppColor.primary,
                    ),
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        foregroundColor: AppColor.secondary,
        backgroundColor: AppColor.primary,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RoomImagesScreen()),
            );
          },
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
