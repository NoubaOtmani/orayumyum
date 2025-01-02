import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orayemem/consts/consts.dart';
import 'package:orayemem/interfaces/restuarnts/widgets/map.dart';
import 'package:orayemem/models/restuarnts.dart';

class LocationScreen extends StatefulWidget {
  final Restuarnt restuarnt;
  const LocationScreen({super.key, required this.restuarnt});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Widget buildCard(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffFEF7E8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
                color: Color(0xff877D61),
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: SafeArea(
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        height: 212,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    NetworkImage(widget.restuarnt.cover ?? ""),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50.0,
                        left: 10,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 38,
                            width: 38,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: MaterialButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                    size: 24,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 38,
                            width: 38,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.heart_fill,
                                  color: Colors.red,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 0, top: 205),
                          child: Container(
                              height: MediaQuery.of(context).size.height - 190,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffFFFDF8),
                                      Color(0xffFFE1D1),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: SingleChildScrollView(
                                  primary: true,
                                  child: Column(children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30.0, left: 20),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.restuarnt.restuarnt_name,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      "assets/icons/clockFill.svg"),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text(
                                                    "OPEN NOW",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff33A952)),
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  const Text(
                                                    "CLOSED AT 22:00",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff877D61)),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                               Row(
                                          children: [
                                            SizedBox(
                                                child: widget
                                                            .restuarnt
                                                            .restuarnt_options
                                                            .isNotEmpty &&
                                                        widget.restuarnt
                                                            .restuarnt_options
                                                            .contains(0)
                                                    ? buildCard("Delivery")
                                                    : const SizedBox(
                                                        height: 0,
                                                      )),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Center(
                                                child: widget
                                                            .restuarnt
                                                            .restuarnt_options
                                                            .isNotEmpty &&
                                                        widget.restuarnt
                                                            .restuarnt_options
                                                            .contains(1)
                                                    ? buildCard("Self Pick-Up")
                                                    : const SizedBox(
                                                        height: 0,
                                                      ))
                                          ],
                                        ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Text(
                                                "Address",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              RestuarntMap(
                                                position: LatLng(
                                                  widget.restuarnt
                                                      .location["latitude"],
                                                  widget.restuarnt
                                                      .location["longitude"],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Text(
                                                "Overview",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              SizedBox(
                                                  width: 390,
                                                  child: Text(
                                                    widget.restuarnt.overview,
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xff292D32)),
                                                  )),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Text(
                                                "Worktime",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const Row(
                                                children: [
                                                  Text(
                                                    "Monday - Friday",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff000000),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    "10:00 - 22:00",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffFA5B01),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Row(
                                                children: [
                                                  Text(
                                                    "Saturday - Sanday",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff000000),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    "12:00 - 20:00",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffFA5B01),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )
                                                ],
                                              ),
                                            ]))
                                  ])))),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 170),
                        child: Container(
                          height: 67.5,
                          width: 67.5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                  widget.restuarnt.profile ?? "",
                                ),
                                fit: BoxFit.cover),
                            border: Border.all(
                              width: 6,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
