import 'package:cocoon_hotelside/view/property_registration/residencyinformation/widgets/property_contact_field.dart';
import 'package:cocoon_hotelside/view/property_registration/residencyinformation/widgets/property_information_bottom_navbar.dart';
import 'package:cocoon_hotelside/view/property_registration/residencyinformation/widgets/property_mail_field.dart';
import 'package:cocoon_hotelside/view/property_registration/residencyinformation/widgets/property_name_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PropertyInformation extends StatelessWidget {
  PropertyInformation({super.key});
  final TextEditingController hotelcontroller = TextEditingController();
  final TextEditingController datecontroller = TextEditingController();
  final TextEditingController contactcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String today = DateFormat('dd-MM-yy').format(DateTime.now());
    datecontroller.text = today;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: HotelNameField(hotelcontroller: hotelcontroller),
              ),
              Text(
                'Taking Booking Since',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    DateFormat('dd-MM-y').format(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              HotelContactField(contactcontroller: contactcontroller),

              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 20),
                child: PropertyMailField(emailcontroller: emailcontroller),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PropertyInformationBottomNavbar(
        hotelcontroller: hotelcontroller,
        datecontroller: datecontroller,
        contactcontroller: contactcontroller,
        emailcontroller: emailcontroller,
      ),
    );
  }
}
