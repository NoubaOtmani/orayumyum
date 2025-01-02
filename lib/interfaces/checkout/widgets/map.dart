import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapCheckout extends StatefulWidget {
  const MapCheckout({super.key});

  @override
  State<MapCheckout> createState() => _MapCheckoutState();
}

class _MapCheckoutState extends State<MapCheckout> {
  late GoogleMapController _controller;
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
  double lati = 0;
  double langi = 0;

  _addIconMarker() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(150.0, 150.0)),
            "assets/icons/marker.png")
        .then((val) {
      _myIcon = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
                myLocationButtonEnabled: false,
                onTap: (latlng) async {},
                onMapCreated: (controller) {
                  _controller = controller;
                },
                zoomControlsEnabled: false,
                markers: myMark,
                initialCameraPosition: _kLake),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  height: 52,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffFFFFFF),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 33,
                              width: 33,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffFE8C00),
                                    Color(0xffF83D00),
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/location.svg",
                                    color: Colors.white,
                                    height: 18,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Work",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "28010 Rue Mouhamed Boudiaf, Berho...",
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
