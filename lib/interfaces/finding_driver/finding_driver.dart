import 'dart:async';
import 'dart:convert';

import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orayemem/models/restuarnts.dart';

class FindingDriverScreen extends StatefulWidget {
  const FindingDriverScreen({
    super.key,
  });

  @override
  State<FindingDriverScreen> createState() => _FindingDriverScreenState();
}

const int STEPS = 4;

class _FindingDriverScreenState extends State<FindingDriverScreen> {
  late GoogleMapController _controller;

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  Set<Marker> myMark = Set.from([]);
  late BitmapDescriptor _myIcon;
  late BitmapDescriptor _restuarntIcon;

  double lati = 0;
  double langi = 0;

  _addIconMarker(String iconName, bool isUser) async {
    await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(150.0, 150.0)),
            "assets/images/$iconName")
        .then((val) {
      if (isUser) {
        _myIcon = val;
      } else {
        _restuarntIcon = val;
      }
    });
  }

  Future<Position> setPositionsAndMarkers(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    langi = position.longitude;
    lati = position.latitude;

    Marker mark = Marker(
        markerId: const MarkerId("userMarker"),
        icon: _myIcon,
        position: LatLng(lati, langi),
        draggable: true,
        onTap: () {},
        onDragEnd: (val) {});
    myMark.add(mark);

    Marker restaurantMarker = Marker(
        markerId: const MarkerId("restaurantMarker"),
        icon: _restuarntIcon,
        position: const LatLng(36.77367327426475, 3.0101636813587866),
        draggable: true,
        onTap: () {},
        onDragEnd: (val) {});
    myMark.add(restaurantMarker);

    setState(() {});
    _controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(zoom: 10, target: LatLng(lati, langi))));

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  final pageController = PageController();
  int initialPage = 0;

  List<StepperData> stepperData = [
    StepperData(
        iconWidget: Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xffFC7B00), Color(0xffF95100)]),
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/box.svg",
            color: Colors.white,
            height: 20,
          )
        ],
      ),
    )),
    StepperData(
        iconWidget: Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xffFC7B00), Color(0xffF95100)]),
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/shop.svg",
            color: Colors.white,
            height: 20,
          )
        ],
      ),
    )),
    StepperData(
        iconWidget: Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xffFC7B00), Color(0xffF95100)]),
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/car.svg",
            color: Colors.white,
            height: 20,
          )
        ],
      ),
    )),
    StepperData(
        iconWidget: Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xffFC7B00), Color(0xffF95100)]),
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/home-2.svg",
            color: Colors.white,
            height: 20,
          )
        ],
      ),
    )),
  ];

  @override
  void initState() {
    setPositionsAndMarkers(context);
    getMarkers();
    super.initState();
  }

  getMarkers() async {
    await _addIconMarker("location-marker.png", true);

    await _addIconMarker("restuarnts-map.png", false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GoogleMap(
                myLocationButtonEnabled: false,
                onTap: (latlng) async {},
                onMapCreated: (controller) {
                  _controller = controller;
                },
                zoomControlsEnabled: false,
                markers: myMark,
                initialCameraPosition: _kLake),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 310,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffFFFDF8),
                    Color(0xffFFE1D1),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Container(
                      height: 3,
                      width: 75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Picking up your order",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Arrives between ",
                          style:
                              TextStyle(fontSize: 13, color: Color(0xffD1CBBB)),
                        ),
                        Text(
                          "  15:36-15:46",
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AnotherStepper(
                      activeIndex: 2,
                      inActiveBarColor: const Color(0xffF5F5F5),
                      activeBarColor: const Color(0xffFA5B01),
                      stepperList: stepperData,
                      stepperDirection: Axis.horizontal,
                      iconWidth: 40,
                      iconHeight: 40,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffF6F0DF),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, left: 10, bottom: 15, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                "assets/images/me.jpeg",
                                              ))),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Rostomy hadjsaid",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/star.svg",
                                              color: const Color(0xffFBBC05),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text(
                                              "4.2",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {},
                                        child: SvgPicture.asset(
                                            "assets/icons/call-driver.svg")),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                        onTap: () {},
                                        child: SvgPicture.asset(
                                            "assets/icons/message-driver.svg")),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 27,
                                  width: 151.5,
                                  decoration: BoxDecoration(
                                      color: Color(0xffE2D9C2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/icons/car.svg",
                                            height: 16,
                                            color: Color(0xff373737),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            "Yamaha MX King",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Container(
                                  height: 27,
                                  width: 151.5,
                                  decoration: BoxDecoration(
                                      color: Color(0xffE2D9C2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/icons/info-circle.svg",
                                            height: 16,
                                            color: const Color(0xff373737),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            "HSW 4736 XK",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
