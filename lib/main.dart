import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:orayemem/interfaces/cart/cart.dart';
import 'package:orayemem/interfaces/checkout/checkout.dart';
import 'package:orayemem/interfaces/feeds/feeds.dart';
import 'package:orayemem/interfaces/feeds/widgts/content_screen.dart';
import 'package:orayemem/interfaces/finding_driver/finding_driver.dart';
import 'package:orayemem/interfaces/home/home.dart';
import 'package:orayemem/interfaces/home/routing.dart';
import 'package:orayemem/interfaces/login/loin.dart';
import 'package:orayemem/interfaces/login/otp.dart';
import 'package:orayemem/interfaces/map_restuarnts/map_restuarnts.dart';
import 'package:orayemem/interfaces/notifications/notifications.dart';
import 'package:orayemem/interfaces/orders/orders.dart';
import 'package:orayemem/interfaces/product/products.dart';
import 'package:orayemem/interfaces/profil/pages/notfications.dart';
import 'package:orayemem/interfaces/profil/profil.dart';
import 'package:orayemem/interfaces/restuarnts/restuarnts.dart';
import 'package:orayemem/interfaces/search/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YemYem',
      theme: ThemeData(
        fontFamily: "Inter",
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
