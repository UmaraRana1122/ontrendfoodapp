import 'package:flutter/material.dart';
import 'package:ontrendfoodapp/Utils/main_color.dart';

class BottomNavBarWidget extends StatefulWidget {
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomAppBar(
          color: MainColor.colorWhite,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {
                  _onItemTapped(0);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/icons/home.png",
                    color: _selectedIndex == 0
                        ? Color(0xFFFF0000)
                        : MainColor.grey,
                  ),
                ),
              ),
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {
                  _onItemTapped(1);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/logo/salad.png",
                    color: _selectedIndex == 1
                        ? Color(0xFFFF0000)
                        : MainColor.grey,
                  ),
                ),
              ),
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {
                  _onItemTapped(2);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.shopping_cart,
                    color: _selectedIndex == 2
                        ? Color(0xFFFF0000)
                        : MainColor.grey,
                  ),
                ),
              ),
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {
                  _onItemTapped(3);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: _selectedIndex == 3
                        ? Color(0xFFFF0000)
                        : MainColor.grey,
                  ),
                ),
              ),
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {
                  _onItemTapped(4);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/icons/profile.png",
                    color: _selectedIndex == 4
                        ? Color(0xFFFF0000)
                        : MainColor.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
