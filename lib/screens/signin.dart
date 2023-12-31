// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uas_testing/screens/auth_services.dart';
import 'package:flutter_uas_testing/screens/settingscreens/forgotpass.dart';
import '../functions/bottomnavbar.dart';
import '../utils/colors.dart';
import 'signup.dart';
import '../functions/text_input.dart';
import '../functions/password_input.dart';
import '../../utils/sizes.dart';
import 'package:flutter_uas_testing/utils/universalvars.dart' as globals;

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _errorText = "";

  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController inputUsername = TextEditingController();
  TextEditingController inputEmail = TextEditingController();
  TextEditingController inputPassword = TextEditingController();

  @override
  void dispose() {
    inputUsername.dispose();
    inputEmail.dispose();
    inputPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(
            top: TSizes.topPad,
            bottom: TSizes.botPad,
            left: TSizes.leftPad,
            right: TSizes.rightPad),
        child: Column(
          children: [
            //JUDUL
            Text(
              'Sign In',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: secondaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: TSizes.defPad),

              //EMAIL
              child: MakeTextField(label: 'Email', controller: inputEmail),
            ),

            SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),

            //PASSWORD
            PasswordTextField(controller: inputPassword),

            //FORGOT PASS
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    print('ini forgot pass');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPass()),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: texthighlightColor,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
            ),

            //BUTTON SIGN IN
            ElevatedButton(
              onPressed: () {
                wait();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonhiglightColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fixedSize: const Size(200.0, 35.0),
              ),
              child: Text(
                'Sign In',
                style: TextStyle(color: primaryColor, fontSize: 20.0),
              ),
            ),

            SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),

            //Error Text
            Text(
              _errorText,
              style: TextStyle(color: errorColor),
            ),

            SizedBox(height: MediaQuery.sizeOf(context).height * 0.001),

            //SIGN UP
            TextButton(
              onPressed: () {
                print('ini signup');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: Text(
                "Don't have an account? Sign Up",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: texthighlightColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    String email = inputEmail.text;
    String password = inputPassword.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print("succeed");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const NavBar()));
    } else {
      print("Akun Salah");
      _showError("Invalid email or password.");
    }
  }

  void _showError(String errorText) {
    setState(() {
      _errorText = errorText;
    });
  }

  Future<void> getUserID() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await for (var authState in auth.authStateChanges()) {
      if (authState != null) {
        globals.uid = authState.uid;
        print("User ID: ${globals.uid}");
        break;
      }
    }
  }

  final CollectionReference _produk =
      FirebaseFirestore.instance.collection('user');

  Future<void> getNamaUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await for (var authState in auth.authStateChanges()) {
      if (authState != null) {
        try {
          DocumentSnapshot userSnapshot =
              await _produk.doc(authState.uid).get();

          if (userSnapshot.exists) {
            Map<String, dynamic> userData =
                userSnapshot.data() as Map<String, dynamic>;
            if (userData.containsKey('points') &&
                userData.containsKey('username') &&
                userData.containsKey('email') &&
                userData.containsKey('url')) {
              setState(() {
                globals.points = userData["points"];
                globals.username = userData["username"];
                globals.email = userData["email"];
                globals.photo = userData["url"];
              });
            } else {
              print(
                  'Kunci \'username\' tidak ditemukan dalam data user dengan ID ${authState.uid}');
            }
          } else {
            print(
                'Dokumen tidak ditemukan untuk user dengan ID ${authState.uid}');
          }
        } catch (e) {
          print('Error: $e');
        }
        break;
      }
    }
  }

  Future<void> wait() async {
    _signIn();
    await getUserID();
    await getNamaUser();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const NavBar()));
  }
}
