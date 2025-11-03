import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_hotelside/controller/bloc/auth/auth_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/booking/booking_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/checkbox/checkbox_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/dashboard/dashboard_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/hotelimages/hotelimages_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/hotelimages/hotelimages_event.dart';
import 'package:cocoon_hotelside/controller/bloc/hotelregistration/hotelregistration_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/property/property_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/rooms_screen/rooms/rooms_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/selection/selection_cubit.dart';
import 'package:cocoon_hotelside/firebase_options.dart';
import 'package:cocoon_hotelside/view/onboarding/screen_check_user_login.dart';
import 'package:cocoon_hotelside/view/onboarding/screen_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await  Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
  


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider<AuthBloc>(create: (_)=>AuthBloc()),
         BlocProvider<SelectionCubit>(create: (_)=>SelectionCubit()),
         BlocProvider<CheckboxBloc>(create: (_)=>CheckboxBloc()),
         BlocProvider<PropertyBloc>(create: (_)=>PropertyBloc()),
         BlocProvider<HotelregistrationBloc>(create: (_)=>HotelregistrationBloc()),
         BlocProvider<RoomsBloc>(create: (_)=>RoomsBloc(FirebaseFirestore.instance)),
         BlocProvider<HotelImagesBloc>(create: (_) => HotelImagesBloc()..add(LoadHotelImages()),),
         BlocProvider<BookingBloc>(create: (_)=>BookingBloc(FirebaseFirestore.instance)),
         BlocProvider<DashboardBloc>(create: (_)=>DashboardBloc())

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cocoon Hotel',
        home: CheckUserScreen()
      ),
    );
  }
}
