import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ontrendfoodapp/Providers/product_provider.dart';
import 'package:ontrendfoodapp/Screens/home_screen.dart';
import 'package:ontrendfoodapp/Screens/login_screen.dart';
import 'package:ontrendfoodapp/Screens/signup_screen.dart';
import 'package:ontrendfoodapp/Screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(),
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
