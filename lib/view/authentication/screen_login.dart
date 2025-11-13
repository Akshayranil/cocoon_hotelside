import 'package:cocoon_hotelside/controller/bloc/auth/auth_bloc.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/utilities/custom_navbar.dart';
import 'package:cocoon_hotelside/utilities/customnavigationscreen.dart';
import 'package:cocoon_hotelside/utilities/reset_passwords.dart';
import 'package:cocoon_hotelside/view/home/screen_home.dart';
import 'package:cocoon_hotelside/view/property_registration/email_success/screen_registration.dart';
import 'package:cocoon_hotelside/view/authentication/screen_signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
   bool obscureText = true;
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login ',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Text(
                      'Plan. Book. Relax. ',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1),
                    child: Text(
                      'Sign in to get started!!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 55),
                    child: TextField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColor.primary,
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                   StatefulBuilder(
  builder: (context, setState) {
    

    return TextField(
      controller: passwordcontroller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColor.primary,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
      ),
    );
  },
),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              final TextEditingController emailcontroller =
                                  TextEditingController();
                              return AlertDialog(
                                title: Text(
                                  'Reset Password',
                                  style: TextStyle(
                                    color: AppColor.ternary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: TextField(
                                  controller: emailcontroller,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your email',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      resetPassword(
                                        context,
                                        emailcontroller.text.trim(),
                                      );
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.primary,
                                    ),
                                    child: Text(
                                      'Sent',
                                      style: TextStyle(
                                        color: AppColor.secondary,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text('Forgot Password?'),
                      ),
                    ],
                  ),

                  if (state is AuthLoading)
                    const CircularProgressIndicator()
                  else
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              final email = emailcontroller.text.trim();
                              final password = passwordcontroller.text.trim();
                              context.read<AuthBloc>().add(
                                AuthLogin(email, password),
                              );
                            },

                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(250, 40),
                              backgroundColor: AppColor.primary,
                              foregroundColor: AppColor.secondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.ternary
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsGeometry.only(left: 66),
                            child: Row(
                              children: [
                                Text("Don't have an account?"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignInScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'SignUp',
                                    style: TextStyle(
                                      color: AppColor.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(color: Colors.grey, thickness: 1),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text('OR'),
                        ),
                        Expanded(
                          child: Divider(color: Colors.grey, thickness: 1),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.width * 0.14,
                      child: SignInButton(
  Buttons.google,
  onPressed: () async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = userCredential.user!;
    
    bool exists = await hasHotelData(user.uid); // Firestore check

    if (exists) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => CustomNavigationscreen(hotelId: user.uid)),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => RegistrationScreen()),
      );
    }
  },
),

                    ),
                  ),
                ],
              ),
            ),
          );
        },
       listener: (context, state) async {
  if (state is AuthSuccess) {
    final user = state.user; // get logged-in user
    bool exists = await hasHotelData(user.uid); // check Firestore

    if (exists) {
      // Existing hotel → go to Dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => CustomNavigationscreen(hotelId:user.uid ,)),
      );
    } else {
      // First-time hotel → go to RegistrationScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => RegistrationScreen()),
      );
    }
  } else if (state is AuthFailure) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(state.error)),
    );
  }
}

      ),
    );
  }

  Future<bool> login() async {
    final user = await GoogleSignIn().signIn();
    GoogleSignInAuthentication userAuth = await user!.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: userAuth.idToken,
      accessToken: userAuth.accessToken,
    );

    UserCredential userCredential =  await FirebaseAuth.instance.signInWithCredential(credential);
    String uid = userCredential.user!.uid;
    return FirebaseAuth.instance.currentUser != null;
  }
}
