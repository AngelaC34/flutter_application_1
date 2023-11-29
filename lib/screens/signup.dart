import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uas_testing/user_auth/firebase_auth_implementation/firebaseauthservices.dart';
import 'package:flutter_uas_testing/utils/colors.dart';

import 'signin.dart';
import '../functions/text_input.dart';
import '../functions/password_input.dart';
import '../../utils/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController passw = TextEditingController();
  bool termsChecked = false;

  @override
  void dispose() {
    nama.dispose();
    email.dispose();
    passw.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: EdgeInsets.only(
            top: TSizes.topPad,
            bottom: TSizes.botPad,
            left: TSizes.leftPad,
            right: TSizes.rightPad),
        child: Column(
          children: [
            //JUDUL
            Text(
              'Sign Up',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor),
            ),

            //TEXT FIELD
            SizedBox(height: 20),
            MakeTextField(label: 'Name', controller: nama),
            SizedBox(height: 10),
            MakeTextField(label: 'Email', controller: email),
            SizedBox(height: 10),
            MakeTextField(label: 'Phone Number', controller: phone),
            SizedBox(height: 10),
            PasswordTextField(controller: passw),
            SizedBox(height: 10),

            //CHECKBOX
            Row(
              children: [
                Checkbox(
                  value: termsChecked,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                    (states) =>
                        BorderSide(width: 1.0, color: buttonhiglightColor),
                  ),
                  activeColor: buttonhiglightColor,
                  onChanged: (value) {
                    setState(
                      () {
                        termsChecked = !termsChecked;
                      },
                    );
                  },
                ),
                TextButton(
                  onPressed: () {
                    print('ini Terms of Services');
                  },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'I have read the ',
                            style: TextStyle(color: secondaryColor)),
                        TextSpan(
                          text: 'Terms of Services',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: secondaryColor),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            //BUTTON SIGN UP
            ElevatedButton(
              onPressed: signUp,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonhiglightColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fixedSize: Size(200.0, 35.0),
              ),
              child: Text('Create Account'),
            ),

            SizedBox(height: 10),
            //Sign In with Other
            Row(
              children: [
                Flexible(
                  child: Divider(
                    color: texthighlightColor,
                    thickness: 0.5,
                    indent: 60,
                    endIndent: 5,
                  ),
                ),
                Text("Or Sign Up With", style: TextStyle(fontSize: 12)),
                Flexible(
                  child: Divider(
                    color: texthighlightColor,
                    thickness: 0.5,
                    indent: 5,
                    endIndent: 60,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(40)),
                  child: IconButton(
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.google),
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(40)),
                  child: IconButton(
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.facebook),
                  ),
                )
              ],
            ),

            Spacer(),
            //SIGN IN
            TextButton(
              onPressed: () {
                print('ini ke signin');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
              child: Text(
                'Already have an account? Sign In',
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

  void signUp() async {
    String _username = nama.text;
    String _email = email.text;
    String _password = passw.text;
    String _number = phone.text;

    User? user = await _auth.signUpWithEmailAndPassword(_email, _password);

    if (user != null) {
      print('User is Successfully Created');
      Navigator.pushNamed(context, '../functions/bottomnavbar.dart');
    } else {
      print('Some error happened');
    }
  }
}
