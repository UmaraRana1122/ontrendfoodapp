import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ontrendfoodapp/Utils/main_color.dart';
import 'package:ontrendfoodapp/Utils/utils.dart';
import 'package:ontrendfoodapp/Widgets/round_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isObscure = true;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void SignUp() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
    }).onError((stackTrace, error) {
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/logo/arrow.png",
                        color: Colors.black,
                        height: 2.h,
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Image.asset(
                    "assets/images/delivery.png",
                    width: 80.w,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Welcome Back!',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 19.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
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
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your email or phone number";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              color: MainColor.colorBlack,
                              fontWeight: FontWeight.w400,
                              fontFamily: "QuicksandMedium",
                            ),
                            decoration: InputDecoration(
                              hintText: 'Email or Phone',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                color: MainColor.grey,
                                fontWeight: FontWeight.w400,
                                fontFamily: "QuicksandRegular",
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
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
                        SizedBox(height: 2.h),
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
                            controller: passwordController,
                            obscureText: _isObscure,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter a password";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              color: MainColor.colorBlack,
                              fontWeight: FontWeight.w400,
                              fontFamily: "QuicksandMedium",
                            ),
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                color: MainColor.grey,
                                fontWeight: FontWeight.w400,
                                fontFamily: "QuicksandRegular",
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: MainColor.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  RoundButton(
                      title: 'Sign Up',
                      loading: loading,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          SignUp();
                        }
                      }),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      'Don’t have an account? ',
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen()));
                      },
                      child: Text('Login here',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff677ea2))),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
