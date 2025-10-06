import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/onboarding/residencytype/screen_chooserecidency.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/success.png',
              height: MediaQuery.of(context).size.width * 0.7,
              width: MediaQuery.of(context).size.height * 0.7,
            ),

            Text(
              'We had registered the email with us.\n You can start registration Process.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(30),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TypeofRecidency()),
            );
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(250, 40),
            backgroundColor: AppColor.primary,
            foregroundColor: AppColor.ternary,
          ),
          child: Text(
            'Start Registration',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
