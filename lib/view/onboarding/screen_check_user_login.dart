import 'package:cocoon_hotelside/utilities/customnavigationscreen.dart';
import 'package:cocoon_hotelside/view/onboarding/screen_splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class CheckUserScreen extends StatelessWidget {

  const CheckUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading while checking user status
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          final user = snapshot.data!;
  final hotelId = user.uid;
          // ✅ User already logged in
          return  CustomNavigationscreen(hotelId: hotelId);
        } else {
          // 🚪 Not logged in — show normal app start flow
          return const SplashScreen();
        }
      },
    );
  }
}
