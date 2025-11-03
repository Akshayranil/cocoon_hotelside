import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/onboarding/screen_splash.dart';
import 'package:cocoon_hotelside/view/profile/screen_help_and_support.dart';
import 'package:cocoon_hotelside/view/profile/screen_privacy_policy.dart';
import 'package:cocoon_hotelside/view/profile/screen_terms_conditions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatelessWidget {
  final String hotelId;
  const ProfileScreen({super.key,required this.hotelId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.secondary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
             Padding(
               padding: const EdgeInsets.only(top: 80),
               child: FutureBuilder<String>(
                 future: getHotelName(),
                 builder: (context, snapshot) {
                   if (!snapshot.hasData) {
                     return CircularProgressIndicator();
                   }
                   return _headeredCard(snapshot.data!);
                 },
               ),
             ),

              

              // Bottom Items
              Padding(
                padding: const EdgeInsets.only(top: 180),
                child: ListTile(
                  leading: const Icon(
                    Icons.help_outline,
                    color: AppColor.secondary,
                  ),
                  title: const Text('Help & Support'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HelpSupportScreen(),
                      ),
                    );
                  },
                ),
              ),

              const Divider(thickness: 1.2),
              ListTile(
                leading: const Icon(
                  Icons.article_outlined,
                  color: AppColor.secondary,
                ),
                title: const Text('Terms & Conditions'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TermsAndConditionsScreen(),
                    ),
                  );
                },
              ),
              const Divider(thickness: 1.2),
              ListTile(
                leading: const Icon(
                  Icons.privacy_tip_outlined,
                  color: AppColor.secondary,
                ),
                title: const Text('Privacy Policy'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivacyPolicyScreen(),
                    ),
                  );
                },
              ),

              const Divider(thickness: 1.2),

              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.red),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.red,
                ),
                onTap: () async {
                  bool isLogedout = await logout();
                  if (isLogedout) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SplashScreen()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      log('Logout error : $e');
      return false;
    }
  }

  Widget _headeredCard(String hotelName) {
    final now = DateTime.now();
    final formattedDate = DateFormat('EEEE, d MMMM yyyy').format(now);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade400, Colors.green.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade200.withOpacity(0.5),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.waving_hand,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                "Welcome Back,",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            hotelName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.calendar_today, color: Colors.white70, size: 16),
              const SizedBox(width: 6),
              Text(
                formattedDate,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<String> getHotelName() async {
  final doc = await FirebaseFirestore.instance
      .collection('hotelregistration')
      .doc(hotelId)
      .get();
  return doc['name'] ?? 'Hotel';
}

}
