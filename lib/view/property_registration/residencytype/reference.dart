// // // import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
// // // import 'package:cocoon_hotelside/utilities/custom_colors.dart';
// // // import 'package:cocoon_hotelside/view/property_registration/propertyverification/screen_ongoingverification.dart';
// // // import 'package:cocoon_hotelside/view/property_registration/residencytype/screen_chooserecidency.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import 'package:cocoon_hotelside/view/property_registration/residencyinformation/property_information.dart';
// // // import 'package:cocoon_hotelside/view/property_registration/residencyfacilities/screen_policy.dart';
// // // import 'package:cocoon_hotelside/view/property_registration/propertyregistration/screen_financelegal.dart';
// // // import 'package:cocoon_hotelside/view/property_registration/propertyimages/screen_propertyimages.dart';

// // // class PreviewHotelDetailsScreen extends StatelessWidget {
// // //   const PreviewHotelDetailsScreen({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return BlocBuilder<HotelregistrationBloc, HotelregistrationState>(
// // //       builder: (context, state) {
// // //         return Scaffold(
// // //           appBar: AppBar(
// // //             title: const Text("Preview Your Details"),
// // //             backgroundColor: AppColor.primary,
// // //             foregroundColor: AppColor.ternary,
// // //           ),
// // //           body: SingleChildScrollView(
// // //             padding: const EdgeInsets.all(16),
// // //             child: Column(
// // //               children: [
// // //                 _buildSection(
// // //                   context,
// // //                   title: "🏠 Residency Type",
// // //                   details: state.type,
// // //                   onEdit: () => Navigator.push(
// // //                     context,
// // //                     MaterialPageRoute(
// // //                       builder: (_) => const TypeofRecidency(isEditing: true),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 _buildSection(
// // //                   context,
// // //                   title: "📄 Property Information",
// // //                   details: """
// // // Hotel Name: ${state.name}
// // // Price: ${state.price}
// // // Booking Since: ${state.booking}
// // // Contact: ${state.phonenumber}
// // // Email: ${state.email}
// // // """,
// // //                   onEdit: () => Navigator.push(
// // //                     context,
// // //                     MaterialPageRoute(
// // //                       builder: (_) =>  PropertyInformation(isEditing: true),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 _buildSection(
// // //                   context,
// // //                   title: "📋 Policies",
// // //                   details: state.facilities.join(", "),
// // //                   onEdit: () => Navigator.push(
// // //                     context,
// // //                     MaterialPageRoute(
// // //                       builder: (_) => const ScreenPolicy(isEditing: true),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 _buildSection(
// // //                   context,
// // //                   title: "💼 Finance & Legal",
// // //                   details: """
// // // PAN: ${state.pan}
// // // GST: ${state.gst}
// // // Property Info: ${state.propertyinformation}
// // // """,
// // //                   onEdit: () => Navigator.push(
// // //                     context,
// // //                     MaterialPageRoute(
// // //                       builder: (_) => const FinanceandPolicy(isEditing: true),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 _buildSection(
// // //                   context,
// // //                   title: "🖼️ Uploaded Images",
// // //                   details: "${state.hotelimages.length} images uploaded",
// // //                   onEdit: () => Navigator.push(
// // //                     context,
// // //                     MaterialPageRoute(
// // //                       builder: (_) => const HotelImagesScreen(isEditing: true),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //           bottomNavigationBar: Padding(
// // //             padding: const EdgeInsets.all(20),
// // //             child: ElevatedButton(
// // //               style: ElevatedButton.styleFrom(
// // //                 backgroundColor: AppColor.primary,
// // //                 foregroundColor: AppColor.ternary,
// // //               ),
// // //               onPressed: () => Navigator.push(
// // //                 context,
// // //                 MaterialPageRoute(builder: (_) => const VerificationScreen()),
// // //               ),
// // //               child: const Text("Confirm & Proceed"),
// // //             ),
// // //           ),
// // //         );
// // //       },
// // //     );
// // //   }

// // //   Widget _buildSection(BuildContext context,
// // //       {required String title,
// // //       required String details,
// // //       required VoidCallback onEdit}) {
// // //     return Card(
// // //       margin: const EdgeInsets.symmetric(vertical: 10),
// // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(12),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //               children: [
// // //                 Text(title,
// // //                     style: const TextStyle(
// // //                         fontWeight: FontWeight.bold, fontSize: 18)),
// // //                 IconButton(
// // //                     onPressed: onEdit,
// // //                     icon: const Icon(Icons.edit, color: Colors.blue))
// // //               ],
// // //             ),
// // //             const SizedBox(height: 8),
// // //             Text(details, style: const TextStyle(fontSize: 16)),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
// // import 'package:cocoon_hotelside/controller/bloc/selection/selection_cubit.dart';
// // import 'package:cocoon_hotelside/utilities/custom_colors.dart';
// // import 'package:cocoon_hotelside/view/property_registration/residencyinformation/property_information.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // // ignore: must_be_immutable
// // class TypeofRecidency extends StatelessWidget {
// //   const TypeofRecidency({super.key});

// //   final List<String> residencyOption = const [
// //     "Hotels",
// //     "Bungalow",
// //     "Dormitory",
// //     "Resort",
// //     "Appartment",
// //     "Villa",
// //   ];
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Color.fromARGB(
// //         255,
// //         124,
// //         125,
// //         123,
// //       ).withValues(alpha: 2.6),

// //       body: SafeArea(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Padding(
// //               padding: EdgeInsets.all(20),
// //               child: Text(
// //                 'What you like to list?',
// //                 style: TextStyle(
// //                   color: AppColor.secondary,
// //                   fontSize: 32,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ),
// //             Padding(
// //               padding: EdgeInsets.all(10),
// //               child: BlocBuilder<SelectionCubit, String?>(
// //                 builder: (context, selectedOption) {
// //                   return Column(
// //                     children: residencyOption.map((option) {
// //                       return Padding(
// //                         padding: EdgeInsets.all(15),
// //                         child: ChoiceChip(
// //                           label: Text(
// //                             option,
// //                             style: TextStyle(
// //                               fontWeight: FontWeight.bold,
// //                               fontSize: 18,
// //                               color: AppColor.ternary,
// //                             ),
// //                           ),
// //                           selected: selectedOption == option,
// //                           onSelected: (_) {
// //                             context.read<SelectionCubit>().select(option);
// //                           },
// //                           shape: RoundedRectangleBorder(
// //                             side: BorderSide(width: 1),
// //                             borderRadius: BorderRadius.circular(10),
// //                           ),
// //                           showCheckmark: false,
// //                           checkmarkColor: AppColor.ternary,
// //                           selectedColor: AppColor.secondary,
// //                           backgroundColor: Colors.grey.withValues(alpha: 0.8),
// //                           labelPadding: EdgeInsets.symmetric(
// //                             horizontal: MediaQuery.of(context).size.width * 0.3,
// //                             vertical: 10,
// //                           ),
// //                         ),
// //                       );
// //                     }).toList(),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //       bottomNavigationBar: Padding(
// //         padding: EdgeInsets.all(20),
// //         child: ElevatedButton(
// //           onPressed: () {
// //             final selectedOption = context.read<SelectionCubit>().state;
// //             if (selectedOption != null) {
// //               context.read<HotelregistrationBloc>().add(
// //                 UpdatedResidencyType(selectedOption),
// //               );
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => PropertyInformation()),
// //               );
// //             } else {
// //               ScaffoldMessenger.of(context).showSnackBar(
// //                 SnackBar(content: Text("Please select a residency type"),backgroundColor: Colors.red,),
// //               );
// //             }
// //           },
// //           style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary),
// //           child: Text(
// //             'Next',
// //             style: TextStyle(
// //               color: AppColor.ternary,
// //               fontSize: 16,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
// import 'package:cocoon_hotelside/view/property_registration/residencyinformation/widgets/property_contact_field.dart';
// import 'package:cocoon_hotelside/view/property_registration/residencyinformation/widgets/property_information_bottom_navbar.dart';
// import 'package:cocoon_hotelside/view/property_registration/residencyinformation/widgets/property_location.dart';
// import 'package:cocoon_hotelside/view/property_registration/residencyinformation/widgets/property_mail_field.dart';
// import 'package:cocoon_hotelside/view/property_registration/residencyinformation/widgets/property_name_field.dart';
// import 'package:cocoon_hotelside/view/property_registration/residencyinformation/widgets/property_price_field.dart';
// import 'package:cocoon_hotelside/utilities/custom_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class PropertyInformation extends StatelessWidget {
//   final bool isEditing; // true if opened from preview screen
//   final VoidCallback? onSave; // optional callback to refresh preview

//   const PropertyInformation({super.key, this.isEditing = false, this.onSave});

//   @override
//   Widget build(BuildContext context) {
//     // Read bloc state to prefill form fields
//     final state = context.watch<HotelregistrationBloc>().state;

//     // Text controllers (recreated on build – acceptable in stateless screens)
//     final TextEditingController hotelcontroller =
//         TextEditingController(text: state.name);
//     final TextEditingController pricecontroller =
//         TextEditingController(text: state.price);
//     final TextEditingController contactcontroller =
//         TextEditingController(text: state.phonenumber);
//     final TextEditingController emailcontroller =
//         TextEditingController(text: state.email);
//     final TextEditingController datecontroller =
//         TextEditingController(text: state.booking);

//     // Year dropdown
//     final ValueNotifier<String> selectedYearNotifier = ValueNotifier(
//       state.booking.isNotEmpty
//           ? state.booking
//           : DateTime.now().year.toString(),
//     );

//     // Generate last 30 years for dropdown
//     final List<String> years = List.generate(
//       30,
//       (index) => (DateTime.now().year - index).toString(),
//     );

//     // Get location after build
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       getLocation(context);
//     });

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(isEditing ? "Edit Property Info" : "Property Information"),
//         backgroundColor: AppColor.primary,
//         foregroundColor: AppColor.ternary,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // 🏨 Hotel name
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: HotelNameField(hotelcontroller: hotelcontroller),
//                 ),

//                 // 💰 Price field
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: PropertyPriceField(pricecontroller: pricecontroller),
//                 ),

//                 // 📅 Booking since dropdown
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Taking Booking Since',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
//                 ValueListenableBuilder<String>(
//                   valueListenable: selectedYearNotifier,
//                   builder: (context, selectedYear, _) {
//                     return Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 12),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Colors.grey.shade400),
//                       ),
//                       child: DropdownButton<String>(
//                         value: selectedYear,
//                         underline: const SizedBox(),
//                         isExpanded: true,
//                         items: years
//                             .map(
//                               (year) => DropdownMenuItem(
//                                 value: year,
//                                 child: Text(year),
//                               ),
//                             )
//                             .toList(),
//                         onChanged: (value) {
//                           if (value == null) return;
//                           selectedYearNotifier.value = value;
//                           datecontroller.text = value;
//                         },
//                       ),
//                     );
//                   },
//                 ),

//                 const SizedBox(height: 12),
//                 // 📞 Contact field
//                 HotelContactField(contactcontroller: contactcontroller),

//                 const SizedBox(height: 20),
//                 // 📧 Email field
//                 PropertyMailField(emailcontroller: emailcontroller),

//                 const SizedBox(height: 80),
//               ],
//             ),
//           ),
//         ),
//       ),

//       // ✅ Updated Bottom Navigation behavior
//       bottomNavigationBar: PropertyInformationBottomNavbar(
//         hotelcontroller: hotelcontroller,
//         pricecontroller: pricecontroller,
//         datecontroller: datecontroller,
//         contactcontroller: contactcontroller,
//         emailcontroller: emailcontroller,
//         isEditing: isEditing,
//         onSave: onSave,
//       ),
//     );
//   }
// }

// import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
// import 'package:cocoon_hotelside/utilities/custom_colors.dart';
// import 'package:cocoon_hotelside/view/property_registration/residencyfacilities/screen_policy.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class PropertyInformationBottomNavbar extends StatelessWidget {
//   final TextEditingController hotelcontroller;
//   final TextEditingController datecontroller;
//   final TextEditingController contactcontroller;
//   final TextEditingController emailcontroller;
//   final TextEditingController pricecontroller;

//   final bool isEditing;

//   /// ✅ Callback for edit mode save
//   final VoidCallback? onSave;

//   const PropertyInformationBottomNavbar({
//     super.key,
//     required this.hotelcontroller,
//     required this.datecontroller,
//     required this.contactcontroller,
//     required this.emailcontroller,
//     required this.pricecontroller,
//     this.isEditing = false,
//     this.onSave, // optional callback
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: SizedBox(
//         width: double.infinity,
//         height: 50,
//         child: ElevatedButton(
//           onPressed: () {
//             // ✅ Validation
//             if (hotelcontroller.text.isEmpty ||
//                 datecontroller.text.isEmpty ||
//                 contactcontroller.text.isEmpty ||
//                 emailcontroller.text.isEmpty ||
//                 pricecontroller.text.isEmpty) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text('Please fill all the fields'),
//                   backgroundColor: Colors.red,
//                 ),
//               );
//               return;
//             }

//             // ✅ Update BLoC data
//             final bloc = context.read<HotelregistrationBloc>();
//             bloc.add(UpdatedResidencyName(hotelcontroller.text));
//             bloc.add(UpdatedBookingTime(datecontroller.text));
//             bloc.add(UpdatedContactNumber(contactcontroller.text));
//             bloc.add(UpdatedEmail(emailcontroller.text));
//             bloc.add(UpdatedPrice(pricecontroller.text));

//             // ✅ Conditional flow
//             if (isEditing) {
//               // Call the callback if provided
//               onSave?.call();

//               // Pop back to preview screen
//               Navigator.pop(context, true);
//             } else {
//               // Normal registration flow
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const ScreenPolicy(),
//                 ),
//               );
//             }
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: AppColor.primary,
//             foregroundColor: AppColor.ternary,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           child: Text(
//             isEditing ? 'Save Changes' : 'Next',
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:cocoon_hotelside/controller/bloc/checkbox/checkbox_bloc.dart';
// import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
// import 'package:cocoon_hotelside/utilities/custom_colors.dart';
// import 'package:cocoon_hotelside/view/property_registration/propertyregistration/screen_financelegal.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ScreenPolicy extends StatelessWidget {
//   final List<String> items = const [
//     "Free cancellation up to 24 hours",
//     "Couple Friendly",
//     "Parking Facility",
//     "Pets not allowed",
//     "Free Wifi",
//     "Swimming Pool/Gym/Spa",
//   ];

//   /// ✅ If opened for editing from Preview
//   final bool isEditing;

//   /// ✅ Callback for edit mode save
//   final VoidCallback? onSave;

//   const ScreenPolicy({
//     super.key,
//     this.isEditing = false,
//     this.onSave,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(isEditing ? "Edit Policies" : "Select Policies"),
//         backgroundColor: AppColor.primary,
//         foregroundColor: AppColor.ternary,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Select the policies you want to implement',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
//             ),
//             const SizedBox(height: 12),
//             Expanded(
//               child: BlocBuilder<CheckboxBloc, CheckboxState>(
//                 builder: (context, state) {
//                   List<bool> checkedList = [];

//                   if (state is CheckboxInitial) {
//                     checkedList = state.ischecked;
//                   } else if (state is Ischecked) {
//                     checkedList = state.ischecked;
//                   }

//                   return ListView.builder(
//                     itemCount: items.length,
//                     itemBuilder: (context, index) {
//                       return CheckboxListTile(
//                         checkColor: AppColor.ternary,
//                         activeColor: AppColor.primary,
//                         title: Text(
//                           items[index],
//                           style: const TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         value: checkedList[index],
//                         onChanged: (_) {
//                           context
//                               .read<CheckboxBloc>()
//                               .add(SelectCheckBox(index));
//                         },
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: ElevatedButton(
//           onPressed: () {
//             final checkboxState = context.read<CheckboxBloc>().state;

//             List<String> selectedPolicies = [];
//             if (checkboxState is Ischecked) {
//               for (int i = 0; i < checkboxState.ischecked.length; i++) {
//                 if (checkboxState.ischecked[i]) {
//                   selectedPolicies.add(items[i]);
//                 }
//               }
//             }

//             if (selectedPolicies.isEmpty) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text('Please select at least one policy'),
//                   backgroundColor: Colors.red,
//                 ),
//               );
//               return;
//             }

//             // ✅ Update HotelregistrationBloc with selected policies
//             context
//                 .read<HotelregistrationBloc>()
//                 .add(UpdatedFacilities(selectedPolicies));

//             // ✅ Conditional flow
//             if (isEditing) {
//               // Call callback if provided (useful for refreshing preview)
//               onSave?.call();
//               Navigator.pop(context, true);
//             } else {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const FinanceandPolicy(),
//                 ),
//               );
//             }
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: AppColor.primary,
//             foregroundColor: AppColor.ternary,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           child: Text(
//             isEditing ? 'Save Changes' : 'Next',
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
// import 'package:cocoon_hotelside/utilities/custom_colors.dart';
// import 'package:cocoon_hotelside/view/property_registration/propertyregistration/widgets/finance_bottom_navbar.dart';
// import 'package:cocoon_hotelside/view/property_registration/propertyregistration/widgets/finance_gst_field.dart';
// import 'package:cocoon_hotelside/view/property_registration/propertyregistration/widgets/finance_pan_field.dart';
// import 'package:cocoon_hotelside/view/property_registration/propertyregistration/widgets/finance_property_information_field.dart';
// import 'package:cocoon_hotelside/view/property_registration/propertyregistration/widgets/finance_radio_buttons.dart';
// import 'package:cocoon_hotelside/view/property_registration/propertyregistration/widgets/finance_upload_registration.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class FinanceandPolicy extends StatelessWidget {
//   /// ✅ Flag to check if editing mode
//   final bool isEditing;

//   /// ✅ Callback to notify parent (Preview screen) after save
//   final VoidCallback? onSave;

//   const FinanceandPolicy({
//     super.key,
//     this.isEditing = false,
//     this.onSave,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // ✅ Access current state from bloc
//     final state = context.watch<HotelregistrationBloc>().state;

//     // ✅ Pre-fill controllers with existing values
//     final pancontroller = TextEditingController(text: state.pan);
//     final informationcontroller =
//         TextEditingController(text: state.propertyinformation);
//     final gstcontroller = TextEditingController(text: state.gst);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(isEditing ? 'Edit Finance & Legal' : 'Finance & Legal'),
//         backgroundColor: AppColor.primary,
//         foregroundColor: AppColor.ternary,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 8),
//               FinancePanField(pancontroller: pancontroller),
//               const SizedBox(height: 16),
//               FinancePropertyInformationField(
//                 informationcontroller: informationcontroller,
//               ),
//               const SizedBox(height: 16),
//               FinanceGstField(gstcontroller: gstcontroller),
//               const SizedBox(height: 16),
//               const OwnedorleasedRadioButton(),
//               const SizedBox(height: 16),
//               const FinanceUploadRegistration(),
//               const SizedBox(height: 80), // spacing for button area
//             ],
//           ),
//         ),
//       ),

//       /// ✅ Pass edit info + callback to bottom navbar
//       bottomNavigationBar: FinanceBottomNavbar(
//         pancontroller: pancontroller,
//         informationcontroller: informationcontroller,
//         gstcontroller: gstcontroller,
//         isEditing: isEditing,
//         onSave: onSave,
//       ),
//     );
//   }
// }

// import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
// import 'package:cocoon_hotelside/utilities/custom_colors.dart';
// import 'package:cocoon_hotelside/view/property_registration/propertyimages/screen_propertyimages.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class FinanceBottomNavbar extends StatelessWidget {
//   final TextEditingController pancontroller;
//   final TextEditingController informationcontroller;
//   final TextEditingController gstcontroller;
//   final bool isEditing;
//   final VoidCallback? onSave;

//   const FinanceBottomNavbar({
//     super.key,
//     required this.pancontroller,
//     required this.informationcontroller,
//     required this.gstcontroller,
//     this.isEditing = false,
//     this.onSave,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: ElevatedButton(
//         onPressed: () {
//           if (pancontroller.text.isEmpty ||
//               informationcontroller.text.isEmpty ||
//               gstcontroller.text.isEmpty) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('Please fill all the fields'),
//                 backgroundColor: Colors.red,
//               ),
//             );
//             return;
//           }

//           // ✅ Send data to Bloc
//           final bloc = context.read<HotelregistrationBloc>();
//           bloc.add(UpdatedPan(pancontroller.text));
//           bloc.add(UpdatedPropertyInformation(informationcontroller.text));
//           bloc.add(UpdatedGSTDetails(gstcontroller.text));

//           // ✅ Decide navigation
//           if (isEditing) {
//             if (onSave != null) {
//               onSave!(); // Trigger save callback
//             }
//             Navigator.pop(context); // Go back to preview
//           } else {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => HotelImagesScreen()),
//             );
//           }
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColor.primary,
//           foregroundColor: AppColor.ternary,
//         ),
//         child: Text(isEditing ? 'Save Changes' : 'Next'),
//       ),
//     );
//   }
// }


// import 'dart:io';
// import 'package:cocoon_hotelside/controller/bloc/hotelimages/hotelimages_bloc.dart';
// import 'package:cocoon_hotelside/controller/bloc/hotelimages/hotelimages_event.dart';
// import 'package:cocoon_hotelside/controller/bloc/hotelimages/hotelimages_state.dart';
// import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
// import 'package:cocoon_hotelside/utilities/custom_claudinary.dart';
// import 'package:cocoon_hotelside/utilities/custom_colors.dart';
// import 'package:cocoon_hotelside/view/property_registration/propertyverification/screen_finalverification.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';

// class HotelImagesScreen extends StatelessWidget {
//   final bool isEditing;
//   final VoidCallback? onSave;

//   const HotelImagesScreen({
//     super.key,
//     this.isEditing = false,
//     this.onSave,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HotelImagesBloc, HotelImagesState>(
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text("Hotel Images"),
//             backgroundColor: AppColor.primary,
//             foregroundColor: AppColor.ternary,
//           ),
//           body: state.isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : state.imageUrls.isEmpty
//                   ? const Center(child: Text("Please upload images"))
//                   : GridView.builder(
//                       padding: const EdgeInsets.all(8),
//                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3,
//                         crossAxisSpacing: 8,
//                         mainAxisSpacing: 8,
//                       ),
//                       itemCount: state.imageUrls.length,
//                       itemBuilder: (context, index) {
//                         return ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: Image.network(
//                             state.imageUrls[index],
//                             fit: BoxFit.cover,
//                           ),
//                         );
//                       },
//                     ),
//           floatingActionButton: FloatingActionButton(
//             backgroundColor: AppColor.primary,
//             foregroundColor: AppColor.secondary,
//             onPressed: () async {
//               final hotelBloc = context.read<HotelregistrationBloc>();
//               final picker = ImagePicker();
//               final pickedFiles = await picker.pickMultiImage();

//               if (pickedFiles.isNotEmpty) {
//                 final images = pickedFiles.map((file) => File(file.path)).toList();

//                 List<String> uploadedUrls = [];

//                 for (var file in images) {
//                   final fileUrl = await hotelimageuploadToCloudinary(file);
//                   if (fileUrl != null) {
//                     uploadedUrls.add(fileUrl);
//                   }
//                 }

//                 if (uploadedUrls.isNotEmpty) {
//                   hotelBloc.add(UpdatedHotelImages(uploadedUrls));
//                 }

//                 context.read<HotelImagesBloc>().add(UploadHotelImages(images));
//               }
//             },
//             child: const Icon(Icons.add_a_photo),
//           ),
//           bottomNavigationBar: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: AppColor.ternary,
//                 backgroundColor: AppColor.primary,
//                 minimumSize: const Size(double.infinity, 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               onPressed: () {
//                 if (isEditing) {
//                   if (onSave != null) {
//                     onSave!();
//                   }
//                   Navigator.pop(context); // Return to Preview screen
//                 } else {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const FinalVerificationScreen(),
//                     ),
//                   );
//                 }
//               },
//               child: Text(isEditing ? 'Save Changes' : 'Next'),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }


// import 'package:cocoon_hotelside/utilities/custom_colors.dart';
// import 'package:cocoon_hotelside/view/property_registration/propertyverification/screen_details_preview.dart';
// import 'package:cocoon_hotelside/view/property_registration/propertyverification/screen_ongoingverification.dart';
// import 'package:flutter/material.dart';

// class FinalVerificationScreen extends StatelessWidget {
//   const FinalVerificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Final Verification')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Final Verification Information',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),

//             Text(
//               'Verification will be done through a third party. We (OTAs) will send an email with the agreement copy including terms and conditions.',
//               style: TextStyle(fontSize: 16),
//             ),

//             SizedBox(height: 20),

//             Text(
//               'Required for verification:',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),

//             Text('• PAN Card', style: TextStyle(fontSize: 16)),
//             Text('• Cancelled Cheque', style: TextStyle(fontSize: 16)),
//             Text('• Licence', style: TextStyle(fontSize: 16)),
//             Text(
//               '• Lease Agreement (If Property on Lease)',
//               style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
//             ),

//             SizedBox(height: 16),

//             Text(
//               'Optional details:',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),

//             Text(
//               '• Hotel GST Details',
//               style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
//             ),
//             Text(
//               '• Channel Manager Details',
//               style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
//             ),
//             Text(
//               '• PMS Details (Property Management System)',
//               style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => PreviewHotelDetailsScreen()),
//             );
//           },
//           style: ElevatedButton.styleFrom(
//             foregroundColor: AppColor.ternary,
//             backgroundColor: AppColor.primary,
//           ),
//           child: Text('Next'),
//         ),
//       ),
//     );
//   }
// }

