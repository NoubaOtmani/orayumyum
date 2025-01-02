import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orayemem/interfaces/feeds/feeds.dart';
import 'package:orayemem/interfaces/feeds/widgts/content_screen.dart';
import 'package:orayemem/interfaces/home/home.dart';
import 'package:orayemem/interfaces/notifications/notifications.dart';
import 'package:orayemem/interfaces/orders/orders.dart';
import 'package:orayemem/interfaces/profil/my_profile.dart';

class RoutingScreen extends StatefulWidget {
  const RoutingScreen({super.key});

  @override
  State<RoutingScreen> createState() => _RoutingScreenState();
}

class _RoutingScreenState extends State<RoutingScreen> {
  List<Widget> widgets = [
    const HomeScreen(),
    const NotificationsScreen(),
    const OrdersScreen(),
    const FeedsScreen(),
    const MyProfile(),
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xffFA5B01),
        selectedLabelStyle: const TextStyle(
          color: Color(0xffFA5B01),
        ),
        unselectedLabelStyle: const TextStyle(
            color: Color(0xff292D32),
            fontWeight: FontWeight.w400,
            fontSize: 11),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: SvgPicture.asset("assets/icons/home-2.svg",
                color: _selectedIndex == 0
                    ? const Color(0xffFA5B01)
                    : _selectedIndex == 3
                        ? const Color(0xff69696A)
                        : const Color(0xff292D32)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: SvgPicture.asset("assets/icons/notification.svg",
                color: _selectedIndex == 1
                    ? const Color(0xffFA5B01)
                    : _selectedIndex == 3
                        ? const Color(0xff69696A)
                        : const Color(0xff292D32)),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: SvgPicture.asset("assets/icons/notification-status.svg",
                color: _selectedIndex == 2
                    ? const Color(0xffFA5B01)
                    : _selectedIndex == 3
                        ? const Color(0xff69696A)
                        : const Color(0xff292D32)),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xff292D32),
            icon: SvgPicture.asset("assets/icons/video-play.svg",
                color: _selectedIndex == 3
                    ? const Color(0xffFA5B01)
                    : const Color(0xff292D32)),
            label: 'Feeds',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: SvgPicture.asset("assets/icons/profile.svg",
                color: _selectedIndex == 4
                    ? const Color(0xffFA5B01)
                    : _selectedIndex == 3
                        ? const Color(0xff69696A)
                        : const Color(0xff292D32)),
            label: 'Profile',
          ),
        ],
      ),
      body: widgets.elementAt(_selectedIndex),
    );
  }
}
