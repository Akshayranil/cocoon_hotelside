import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/property_registration/propertyverification/screen_details_preview.dart';
import 'package:cocoon_hotelside/view/property_registration/propertyverification/screen_ongoingverification.dart';
import 'package:flutter/material.dart';

class FinalVerificationScreen extends StatelessWidget {
  const FinalVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Final Verification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Final Verification Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            Text(
              'Verification will be done through a third party. We (OTAs) will send an email with the agreement copy including terms and conditions.',
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 20),

            Text(
              'Required for verification:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Text('• PAN Card', style: TextStyle(fontSize: 16)),
            Text('• Cancelled Cheque', style: TextStyle(fontSize: 16)),
            Text('• Licence', style: TextStyle(fontSize: 16)),
            Text(
              '• Lease Agreement (If Property on Lease)',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),

            SizedBox(height: 16),

            Text(
              'Optional details:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Text(
              '• Hotel GST Details',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            Text(
              '• Channel Manager Details',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            Text(
              '• PMS Details (Property Management System)',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PreviewHotelDetailsScreen()),
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
