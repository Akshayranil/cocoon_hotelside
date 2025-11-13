import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/property_registration/propertyverification/screen_ongoingverification.dart';
import 'package:cocoon_hotelside/view/property_registration/residencytype/screen_chooserecidency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cocoon_hotelside/view/property_registration/residencyinformation/property_information.dart';
import 'package:cocoon_hotelside/view/property_registration/residencyfacilities/screen_policy.dart';
import 'package:cocoon_hotelside/view/property_registration/propertyregistration/screen_financelegal.dart';
import 'package:cocoon_hotelside/view/property_registration/propertyimages/screen_propertyimages.dart';

class PreviewHotelDetailsScreen extends StatelessWidget {
  const PreviewHotelDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelregistrationBloc, HotelregistrationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Preview Your Details"),
            backgroundColor: AppColor.primary,
            foregroundColor: AppColor.ternary,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSection(
                  context,
                  title: "🏠 Residency Type",
                  details: state.type,
                  onEdit: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TypeofRecidency(isEditing: true,)),
                  ),
                ),

                _buildSection(
                  context,
                  title: "📄 Property Information",
                  details:
                      """
Hotel Name: ${state.name}
Price: ${state.price}
Booking Since: ${state.booking}
Contact: ${state.phonenumber}
Email: ${state.email}
                  """,
                  onEdit: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => BlocProvider.value(
                      value: context.read<HotelregistrationBloc>(),
                      child: PropertyInformation(isEditing: true,),)),
                  ),
                ),

                _buildSection(
                  context,
                  title: "📋 Policies",
                  details: state.facilities.join(", "),
                  onEdit: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ScreenPolicy(isEditing: true,)),
                  ),
                ),

                _buildSection(
                  context,
                  title: "💼 Finance & Legal",
                  details:
                      """
PAN: ${state.pan}
GST: ${state.gst}
Property Info: ${state.propertyinformation}
                  """,
                  onEdit: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => BlocProvider.value(
                      value: context.read<HotelregistrationBloc>(),
                      child: FinanceandPolicy(isEditing: true,),)),
                  ),
                ),

                _buildSection(
                  context,
                  title: "🖼️ Uploaded Images",
                  details: "${state.hotelimages.length} images uploaded",
                  onEdit: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HotelImagesScreen(isEditing: true,),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const VerificationScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                foregroundColor: AppColor.ternary,
              ),
              child: const Text("Confirm & Proceed"),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String details,
    required VoidCallback onEdit,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: onEdit,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(details, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
