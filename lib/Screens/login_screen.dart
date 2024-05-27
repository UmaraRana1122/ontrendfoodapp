import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ontrendfoodapp/Screens/forget_password.dart';
import 'package:ontrendfoodapp/Screens/home_screen.dart';
import 'package:ontrendfoodapp/Screens/signup_screen.dart';
import 'package:ontrendfoodapp/Utils/main_color.dart';
import 'package:ontrendfoodapp/Widgets/button_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isObscure = true;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            if (value!.isEmpty ||
                                !(RegExp(r'^[a-zA-Z0-9]+$')).hasMatch(value)) {
                              return "Please enter a valid email";
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
                SizedBox(height: 1.5.h),
                Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgetPassword()));
                          FocusScope.of(context).unfocus();
                        },
                        child: Text("Forgot Password?",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff677ea2))))),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: buttonWidget(7, 85, "Login")),
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
                  InkWell(onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>SignupScreen()));
                  },
                    child: Text('Register here',
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
    );
  }
}
