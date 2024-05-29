import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ontrendfoodapp/Providers/product_provider.dart';
import 'package:ontrendfoodapp/Screens/auth/login_screen.dart';
import 'package:ontrendfoodapp/Screens/splash_screen.dart';
import 'package:ontrendfoodapp/Utils/main_color.dart';
import 'package:ontrendfoodapp/Widgets/bottom_navigation_bar.dart';
import 'package:ontrendfoodapp/Widgets/container_widget.dart';
import 'package:ontrendfoodapp/Widgets/food_widget.dart';
import 'package:ontrendfoodapp/Widgets/offers_widget.dart';
import 'package:ontrendfoodapp/Widgets/top_resturents_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider productProvider;
  final PageController _pageController = PageController();
  int selectedPage = 0;
  var _pagelist = [
    const SplashScreen(),
    const HomeScreen(),
    const LoginScreen(),
  ];
  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchOffersProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/logo/location.png",
                        color: Color(0xfffe5900),
                        height: 3.h,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Janub Ad Dehriz',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                          Text(
                            'Salalah, Oman',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      containerWidget(Icons.favorite_border_outlined),
                      SizedBox(
                        width: 3.w,
                      ),
                      containerWidget(Icons.notifications_none_outlined),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.search,
                            color: Color(0xfffe5900),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText:
                                  'Dishes, Burger, Restaurants, Pizza, ...',
                              hintStyle: TextStyle(color: Colors.black38),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          height: 24.0,
                          child: VerticalDivider(
                            color: Colors.black,
                            thickness: 1.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.mic,
                            color: Color(0xfffe5900),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  // Horizontal Scrollable Containers
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.20,
                    child: PageView(
                      controller: _pageController,
                      children: [
                        _buildPromoContainer(context),
                        _buildPromoContainer(context),
                        _buildPromoContainer(context),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  // Smooth Page Indicator
                  Align(
                    alignment: Alignment.center,
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: ScrollingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: Color(0xfffe5900),
                        dotColor: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Categories',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    height: MediaQuery.of(context).size.height * 0.27,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              foodWidget("assets/images/a.png", "Noodles"),
                              foodWidget("assets/images/b.png", "Pizza"),
                              foodWidget("assets/images/c.png", "Cake"),
                              foodWidget("assets/images/c.png", "Dosa"),
                              foodWidget("assets/images/b.png", "Dosa"),
                              foodWidget("assets/images/c.png", "Dosa"),
                              foodWidget("assets/images/a.png", "Dosa"),
                            ],
                          ),
                          Row(
                            children: [
                              foodWidget("assets/images/a.png", "Noodles"),
                              foodWidget("assets/images/b.png", "Pizza"),
                              foodWidget("assets/images/c.png", "Cake"),
                              foodWidget("assets/images/b.png", "Dosa"),
                              foodWidget("assets/images/c.png", "Dosa"),
                              foodWidget("assets/images/a.png", "Dosa"),
                              foodWidget("assets/images/b.png", "Dosa"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Offers',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 17.sp,
                          ),
                        ),
                      ),
                      Text(
                        'View all',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Wrap(
                      spacing: 8.0, // Horizontal spacing between items
                      runSpacing: 8.0,
                      children: productProvider.getOffersProductDataList
                          .map((offersProductData) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.46,
                          height: MediaQuery.of(context).size.height * 0.17,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(
                                offersProductData.productImage,
                              ), // Replace with your image URL
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.46,
                                height:
                                    MediaQuery.of(context).size.height * 0.17,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.6),
                                      Colors.black.withOpacity(0.6),
                                      Colors.transparent,
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(11.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      offersProductData.productName,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Starting from",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: offersProductData.productPrice
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '  OMR 50',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList()
                      // children: [

                      //   // offersWidget(context, "assets/images/piizza.png",
                      //   //     "Domino\'s Pizza", "Starting from", "Omr3"),
                      //   offersWidget(context, "assets/images/piizza.png",
                      //       "Domino\'s Pizza", "Starting from", "Omr3"),
                      // ],
                      ),

                  SizedBox(height: 1.h),
                  Text(
                    'Top rated restaurants near you',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        toprestaurantsWidget(
                            context, "assets/images/piizza.png", "Mcdonalds"),
                        toprestaurantsWidget(
                            context, "assets/images/bakingo.png", "Bakingo"),
                        toprestaurantsWidget(
                            context, "assets/images/zomato.png", "Zomato"),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    'Restaurants to Explore',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFEEEEEE)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/images/pizza.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.10,
                          width: MediaQuery.of(context).size.width * 0.95,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Domino's Pizza",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "QuicksandSemiBold",
                                      color: MainColor.colorBlack,
                                    ),
                                  ),
                                  Container(
                                    height: 3.h,
                                    width: 12.w,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "4.2",
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "QuicksandSemiBold",
                                              color: MainColor.colorWhite,
                                            ),
                                          ),
                                          SizedBox(width: 2),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 15,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Pizza,Pasta,Dessert",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "QuicksandSemiBold",
                                      color: MainColor.grey,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 6,
                                    width: 6,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    "OMR 27 for one",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "QuicksandSemiBold",
                                      color: MainColor.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "40-45 min",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "QuicksandSemiBold",
                                      color: MainColor.grey,
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Container(
                                    height: 6,
                                    width: 6,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "6.8 km",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "QuicksandSemiBold",
                                      color: MainColor.grey,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Salalah",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "QuicksandSemiBold",
                                      color: MainColor.grey,
                                    ),
                                  ),
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Color(0xfffe5900),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }

  // Promo Container
  Widget _buildPromoContainer(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        color: Color(0xfffe5900),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20.0,
            left: 20.0,
            child: Text(
              'WELCOME TO ONTREND',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            top: 60.0,
            left: 20.0,
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Enjoy ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                    ),
                  ),
                  TextSpan(
                    text: 'Free delivery\n',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 19.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: '& ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '50% OFF',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 19.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: ' on your\n first order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: -17,
            child: Image.asset(
              "assets/icons/gifts.png",
              height: 15.h,
            ),
          ),
        ],
      ),
    );
  }
}
