import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ontrendfoodapp/Posts/post_screen.dart';
import 'package:ontrendfoodapp/Utils/main_color.dart';
import 'package:ontrendfoodapp/Utils/utils.dart';
import 'package:ontrendfoodapp/Widgets/round_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VerifyCodeScreen extends StatefulWidget {
  final verificationId;
  const VerifyCodeScreen({super.key, required this.verificationId});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final verifyCodeController = TextEditingController();
  bool loading = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify"),
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
                controller: verifyCodeController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  color: MainColor.colorBlack,
                  fontWeight: FontWeight.w400,
                  fontFamily: "QuicksandMedium",
                ),
                decoration: InputDecoration(
                  hintText: '6 digit code',
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
                title: "Verify",
                loading: loading,
                onTap: () async {
                  setState(() {
                    loading = true;
                  });
                  final credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: verifyCodeController.text.toString());
                  try {
                    await auth.signInWithCredential(credential);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PostScreen()));
                  } catch (e) {
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessage(e.toString());
                  }
                })
          ],
        ),
      ),
    );
  }
}
