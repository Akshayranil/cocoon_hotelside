import 'dart:developer';
import 'dart:io';

import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/property/property_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/property/property_event.dart';
import 'package:cocoon_hotelside/controller/bloc/property/property_state.dart';
import 'package:cocoon_hotelside/utilities/custom_claudinary.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinanceUploadRegistration extends StatelessWidget {
  const FinanceUploadRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            }
            log('Upload clicked');
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

        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<PropertyBloc, PropertyState>(
            builder: (context, state) {
              if (state.filePath != null) {
                final fileExtension = state.filePath!.split('.').last.toLowerCase();

                // ✅ Show image preview if it's jpg/png
                if (fileExtension == 'jpg' || fileExtension == 'png') {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Selected: ${state.filePath!.split('/').last}"),
                      const SizedBox(height: 8),
                      Image.file(
                        File(state.filePath!),
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ],
                  );
                } else {
                  // Show just filename for pdf or other files
                  return Text("Selected: ${state.filePath!.split('/').last}");
                }
              }
              return const Text("No file selected");
            },
          ),
        ),
      ],
    );
  }
}
