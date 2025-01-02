import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RestuarntMap extends StatefulWidget {
  final LatLng position;
  const RestuarntMap({super.key, required this.position});

  @override
  State<RestuarntMap> createState() => _RestuarntMapState();
}

class _RestuarntMapState extends State<RestuarntMap> {
  late GoogleMapController _controller;
  Set<Marker> myMark = Set.from([]);
  late BitmapDescriptor _myIcon;
  double lati = 0;
  double langi = 0;
  String _address = "";

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  _addIconMarker() async {
    await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(200.0, 200.0)),
            "assets/images/restuarnts-map.png")
        .then((val) {
      print(val);
      _myIcon = val;
    });
    Marker mark = Marker(
        markerId: const MarkerId("user"),
        icon: _myIcon,
        position: LatLng(widget.position.latitude, widget.position.longitude),
        draggable: true,
        onDragEnd: (val) {});
    myMark.add(mark);
    List<Placemark> placemarks = await placemarkFromCoordinates(
        widget.position.latitude, widget.position.longitude,
        localeIdentifier: "FR");
    if (mounted) {
      setState(() {
        _address =
            "${placemarks.first.locality} , ${placemarks.first.subLocality} , ${placemarks.first.street} , ${placemarks.first.country}";
      });
    }
  }

  @override
  void initState() {
    _addIconMarker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        height: 180,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
                myLocationButtonEnabled: false,
                onTap: (latlng) async {},
                onMapCreated: (controller) {
                  _controller = controller;
                  _controller.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                          zoom: 15,
                          target: LatLng(widget.position.latitude,
                              widget.position.longitude))));
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 140,
                                  child: Text(
                                    _address,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 13),
                                  ),
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
