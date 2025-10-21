import 'package:cocoon_hotelside/view/property_registration/propertyregistration/widgets/finance_bottom_navbar.dart';
import 'package:cocoon_hotelside/view/property_registration/propertyregistration/widgets/finance_gst_field.dart';
import 'package:cocoon_hotelside/view/property_registration/propertyregistration/widgets/finance_pan_field.dart';
import 'package:cocoon_hotelside/view/property_registration/propertyregistration/widgets/finance_property_information_field.dart';
import 'package:cocoon_hotelside/view/property_registration/propertyregistration/widgets/finance_radio_buttons.dart';
import 'package:cocoon_hotelside/view/property_registration/propertyregistration/widgets/finance_upload_registration.dart';
import 'package:flutter/material.dart';

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
                FinancePanField(pancontroller: pancontroller),
                FinancePropertyInformationField(
                  informationcontroller: informationcontroller,
                ),
                FinanceGstField(gstcontroller: gstcontroller),
                OwnedorleasedRadioButton(),
                FinanceUploadRegistration(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: FinanceBottomNavbar(
        informationcontroller: informationcontroller,
        gstcontroller: gstcontroller,
        pancontroller: pancontroller,
      ),
    );
  }
}
