import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ontrendfoodapp/Screens/auth/verify_code.dart';
import 'package:ontrendfoodapp/Utils/main_color.dart';
import 'package:ontrendfoodapp/Utils/utils.dart';
import 'package:ontrendfoodapp/Widgets/round_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  final phoneNumberController = TextEditingController();
  bool loading = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login with Phone"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 7.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 3,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: TextFormField(
                controller: phoneNumberController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  color: MainColor.colorBlack,
                  fontWeight: FontWeight.w400,
                  fontFamily: "QuicksandMedium",
                ),
                decoration: InputDecoration(
                  hintText: '+92 340 1122334',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    color: MainColor.grey,
                    fontWeight: FontWeight.w400,
                    fontFamily: "QuicksandRegular",
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: MainColor.colorE6E6E6,
                    ),
                  ),
                  errorStyle: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontFamily: "QuicksandRegular",
                    color: MainColor.heartRed,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: MainColor.colorE6E6E6,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: MainColor.colorE6E6E6,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: MainColor.colorE6E6E6,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: MainColor.colorE6E6E6,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            RoundButton(
                title: "Login",
                onTap: () {
                  auth.verifyPhoneNumber(
                      phoneNumber: phoneNumberController.text,
                      verificationCompleted: (_) {},
                      verificationFailed: (e) {
                        Utils().toastMessage(e.toString());
                      },
                      codeSent: (String verificationId, int? token) {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyCodeScreen(verificationId: verificationId,)));
                      },
                      codeAutoRetrievalTimeout: (e) {
                        Utils().toastMessage(e.toString());
                      });
                })
          ],
        ),
      ),
    );
  }
}
