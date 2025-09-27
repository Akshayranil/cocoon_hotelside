import 'dart:developer';
import 'dart:io';
import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/property/property_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/property/property_event.dart';
import 'package:cocoon_hotelside/controller/bloc/property/property_state.dart';
import 'package:cocoon_hotelside/utilities/custom_claudinary.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/onboarding/screen_finalverification.dart';
import 'package:cocoon_hotelside/view/onboarding/screen_propertyimages.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinanceandPolicy extends StatelessWidget {
  FinanceandPolicy({super.key});
  final TextEditingController pancontroller = TextEditingController();
  final TextEditingController informationcontroller = TextEditingController();
  final TextEditingController gstcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Finance and Legal')),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: pancontroller,
                    decoration: InputDecoration(
                      hintText: 'PAN Details',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: TextFormField(
                    controller: informationcontroller,
                    decoration: InputDecoration(
                      hintText: 'Property Information',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: TextFormField(
                    controller: gstcontroller,
                    decoration: InputDecoration(
                      hintText: 'GST Details',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Property Information',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Is your property owned or leased',
                        style: TextStyle(fontSize: 16),
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
                                    UpdatedOwnedorLeased(value!)
                                  );
                                },
                              ),
                              RadioListTile<String>(
                                title: Text("Leased"),
                                value: "leased",
                                groupValue: state.isOwnedorLeased,
                                onChanged: (value) {
                                  context.read<HotelregistrationBloc>().add(
                                    UpdatedOwnedorLeased(value!)
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Do you have registration?',
                        style: TextStyle(fontSize: 16),
                      ),
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
                                    UpdatedHaveRegistration(value!)
                                  );
                                },
                              ),
                              RadioListTile<String>(
                                title: Text("No"),
                                value: "no",
                                groupValue: state.haveRegistration,
                                onChanged: (value) {
                                  context.read<HotelregistrationBloc>().add(
                                    UpdatedHaveRegistration(value!)
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    final hotelbloc = context.read<HotelregistrationBloc>();
                    final propertybloc = context.read<PropertyBloc>();

                    final result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf', 'jpg', 'png'],
                    );

                    if (result != null && result.files.single.path != null) {
                      final file = File(result.files.single.path!);
                      final fileUrl = await uploadToCloudinary(file);
                      if (fileUrl != null) {
                        hotelbloc.add(UpdatedDocument(fileUrl));
                      }
                      propertybloc.add(RegistrationFilePicked(file.path));
                      // context.read<HotelregistrationBloc>().document = fileUrl;
                    }
                    log('print clicked');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColor.ternary,
                    backgroundColor: const Color.fromARGB(255, 183, 180, 177),
                    minimumSize: Size(
                      MediaQuery.of(context).size.width * 0.9,
                      MediaQuery.of(context).size.height * 0.1,
                    ),
                  ),
                  icon: const Icon(Icons.upload_file),
                  label: const Text("Upload Registration"),
                ),
                BlocBuilder<PropertyBloc, PropertyState>(
                  builder: (context, state) {
                    if (state.filePath != null) {
                      return Text(
                        "Selected: ${state.filePath!.split('/').last}",
                      );
                    }
                    return const Text("No file selected");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            context.read<HotelregistrationBloc>().add(
              UpdatedPan(pancontroller.text),
            );
            context.read<HotelregistrationBloc>().add(
              UpdatedPropertyInformation(informationcontroller.text),
            );
            context.read<HotelregistrationBloc>().add(
              UpdatedGSTDetails(gstcontroller.text),
            );

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HotelImagesScreen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColor.ternary,
            backgroundColor: AppColor.primary,
          ),
          child: Text('Next'),
        ),
      ),
    );
  }
}
