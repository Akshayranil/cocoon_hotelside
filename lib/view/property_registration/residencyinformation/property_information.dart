import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
import 'package:cocoon_hotelside/view/property_registration/residencyinformation/widgets/property_contact_field.dart';
import 'package:cocoon_hotelside/view/property_registration/residencyinformation/widgets/property_information_bottom_navbar.dart';
import 'package:cocoon_hotelside/view/property_registration/residencyinformation/widgets/property_location.dart';
import 'package:cocoon_hotelside/view/property_registration/residencyinformation/widgets/property_mail_field.dart';
import 'package:cocoon_hotelside/view/property_registration/residencyinformation/widgets/property_name_field.dart';
import 'package:cocoon_hotelside/view/property_registration/residencyinformation/widgets/property_price_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertyInformation extends StatelessWidget {
  final bool isEditing;
  PropertyInformation({super.key,this.isEditing=false});

  // ✅ Controllers
  final TextEditingController hotelcontroller = TextEditingController();
  final TextEditingController datecontroller = TextEditingController();
  final TextEditingController contactcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();

  // ✅ Persist selected year using ValueNotifier
  final ValueNotifier<String> selectedYearNotifier = ValueNotifier(
    DateTime.now().year.toString(),
  );

  @override
  Widget build(BuildContext context) {
    // Load location when UI is ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getLocation(context);
    });

    // ✅ Generate dropdown years (last 30 years)
    List<String> years = List.generate(
      30,
      (index) => (DateTime.now().year - index).toString(),
    );
     final blocState = context.read<HotelregistrationBloc>().state;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isEditing) {
        hotelcontroller.text = blocState.name ?? '';
        pricecontroller.text = blocState.price ?? '';
        datecontroller.text = blocState.booking ?? '';
        contactcontroller.text = blocState.phonenumber ?? '';
        emailcontroller.text = blocState.email ?? '';

        if (blocState.booking != null && blocState.booking!.isNotEmpty) {
          selectedYearNotifier.value = blocState.booking!;
        }
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: HotelNameField(hotelcontroller: hotelcontroller),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: PropertyPriceField(pricecontroller: pricecontroller),
              ),

              // ✅ Dropdown for "Taking Booking Since"
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Taking Booking Since',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  ValueListenableBuilder<String>(
                    valueListenable: selectedYearNotifier,
                    builder: (context, selectedYear, _) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: DropdownButton<String>(
                          value: selectedYear,
                          underline: const SizedBox(),
                          isExpanded: true,
                          items: years.map((year) {
                            return DropdownMenuItem(
                              value: year,
                              child: Text(year),
                            );
                          }).toList(),
                          onChanged: (value) {
                            selectedYearNotifier.value = value!;

                            // ✅ Update text controller for later use
                            datecontroller.text = value;
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),

              HotelContactField(contactcontroller: contactcontroller),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: PropertyMailField(emailcontroller: emailcontroller),
              ),
            ],
          ),
        ),
      ),

      // ✅ Pass all fields to bottom navigation button
      bottomNavigationBar: PropertyInformationBottomNavbar(
        pricecontroller: pricecontroller,
        hotelcontroller: hotelcontroller,
        datecontroller: datecontroller,
        contactcontroller: contactcontroller,
        emailcontroller: emailcontroller,
        isEditing:isEditing,
      ),
    );
  }
}
