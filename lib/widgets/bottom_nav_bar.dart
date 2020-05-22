import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/bulb.svg'),
            title: Text('bulb'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/Icon_feather_home.svg'),
            title: Text('home'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/Icon_feather_settings.svg'),
            title: Text('settings'),
          ),
        ],
      ),
    );
  }
}
