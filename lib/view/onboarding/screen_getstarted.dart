import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/authentication/screen_login.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset('assets/image3.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,),
          ),
          Container(
              color: const Color.fromARGB(
                255,
                124,
                125,
                123,
              ).withValues(alpha: 0.5),
            ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Cocoon',style: TextStyle(fontSize: 52,fontWeight: FontWeight.bold,color: AppColor.ternary),
                ),
                 Text(
                    'Wherever you go, we make it feel like home.', 
                    style: TextStyle(
                      color: AppColor.ternary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  
              ],
            )
          ),
           Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 60),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    foregroundColor: AppColor.secondary,
                    minimumSize: Size(230, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColor.ternary),
                  ),
                ),
              ),
            ),
        ],
      ));
  }
}
