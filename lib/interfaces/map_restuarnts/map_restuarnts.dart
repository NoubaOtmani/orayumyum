import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orayemem/consts/consts.dart';
import 'package:orayemem/interfaces/search/filter.dart';
import 'package:orayemem/interfaces/widgets/restuarnt.dart';
import 'package:orayemem/models/restuarnts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MapRestuarntsScreen extends StatefulWidget {
  const MapRestuarntsScreen({super.key});

  @override
  State<MapRestuarntsScreen> createState() => _MapRestuarntsScreenState();
}

class _MapRestuarntsScreenState extends State<MapRestuarntsScreen> {
  ScrollController scrollController = ScrollController();

  late GoogleMapController _controller;
  TextEditingController locationController = TextEditingController();
  final StreamController _currentPossitionController =
      BehaviorSubject<GoogleMapInputs>();
  final StreamController _currentPossitionTextController =
      BehaviorSubject<String>();
  @override
  Sink get currentLocationTextInput => _currentPossitionTextController.sink;

  @override
  Stream<String> get currentLocationTextOutput =>
      _currentPossitionTextController.stream
          .map((locationText) => locationText);

  @override
  Sink get currentDataInput => _currentPossitionController.sink;

  @override
  Stream<GoogleMapInputs> get currentDataOutput =>
      _currentPossitionController.stream.map((data) => data);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  Set<Marker> myMark = Set.from([]);
  late BitmapDescriptor _myIcon;
  double lati = 0; // this is String for latitude
  double langi = 0; // this is String for langitude
  _addIconMarker() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(150.0, 150.0)),
            "assets/icons/restuarnts-map.png")
        .then((val) {
      _myIcon = val;
    });
  }

  Widget buildTopRestaurantsCard(Restuarnt restuarnt) {
    return buildTopRestaurants(context, false, restuarnt);
  }

  Future<Position> getGeoLocationPosition(BuildContext context) async {
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

    for (var i = 0; i < restuarnts.length; i++) {
      Marker mark = Marker(
          markerId: MarkerId(i.toString()),
          icon: _myIcon,
          position: LatLng(restuarnts[i].location["latitude"],
              restuarnts[i].location["longitude"]),
          draggable: true,
          onTap: () {
            double width = MediaQuery.of(context).size.width - 40;
            scrollController.animateTo(
              i * width,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
            );
          },
          onDragEnd: (val) {});
      myMark.add(mark);
    }
    setState(() {});
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        zoom: 10,
        target: LatLng(restuarnts.first.location["latitude"],
            restuarnts.first.location["longitude"]))));

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  void initState() {
    _addIconMarker();
    getGeoLocationPosition(context);
    scrollController.addListener(() {});
    super.initState();
  }

  Widget buildSortFilterButtons(String title, String icon) {
    return Container(
      width: 80,
      height: 32,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 6,
              offset: const Offset(0, 3),
              color: const Color(0xff00000029).withOpacity(0.2)),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/$icon.svg",
                color: const Color(0xffFA5B01),
                height: 18,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 13),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSearchField() {
    return Container(
      height: 44,
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 6,
              offset: const Offset(0, 3),
              color: const Color(0xff00000029).withOpacity(0.2)),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 5),
                    prefixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 20,
                            child: SvgPicture.asset(
                              'assets/icons/arrow-left.svg',
                              width: 20,
                            )),
                      ],
                    ),
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: const TextStyle(
                        color: Color(0xff9D9D9D),
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
              ),
              Container(
                height: 19,
                width: 2,
                color: const Color(0xffDFDFDF),
              ),
              Text("49 W 47th st"),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const FilterScreen();
                    }));
                  },
                  child: SvgPicture.asset("assets/icons/picture-frame.svg"))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: StreamBuilder<GoogleMapInputs>(
              stream: currentDataOutput,
              builder: (context, snapshot) => GoogleMap(
                  myLocationButtonEnabled: false,
                  onTap: (latlng) async {},
                  onMapCreated: (controller) {
                    _controller = controller;
                  },
                  zoomControlsEnabled: false,
                  markers: myMark,
                  initialCameraPosition: CameraPosition(
                      zoom: 16,
                      target: snapshot.data?.latlang ??
                          const LatLng(35.702977, -0.644322))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 0),
            child: Column(
              children: [
                buildSearchField(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      buildSortFilterButtons("Sort by", "sort"),
                      const SizedBox(
                        width: 10,
                      ),
                      buildSortFilterButtons("Filter", "setting-4"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 220,
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: restuarnts.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        buildTopRestaurantsCard(restuarnts[index]),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

abstract class LocationOutputs {
  Stream<GoogleMapInputs> get currentDataOutput;
  Stream<String> get currentLocationTextOutput;
}

class GoogleMapInputs {
  LatLng latlang;
  Set<Marker> marker;
  BitmapDescriptor icon;
  GoogleMapInputs(this.latlang, this.marker, this.icon);
}

enum PermissionGroup {
  locationAlways,

  locationWhenInUse
}
