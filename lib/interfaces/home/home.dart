import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orayemem/consts/consts.dart';
import 'package:orayemem/interfaces/cart/cart.dart';
import 'package:orayemem/interfaces/home/scan_qr_code.dart';
import 'package:orayemem/interfaces/widgets/categories_list_hor.dart';
import 'package:orayemem/interfaces/widgets/product_hoz.dart';
import 'package:orayemem/interfaces/widgets/restuarnt.dart';
import 'package:orayemem/interfaces/widgets/search_field.dart';
import 'package:orayemem/models/products.dart';
import 'package:orayemem/models/restuarnts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _address = "";

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

    List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude,
        localeIdentifier: "FR");
    if (mounted) {
      setState(() {
        _address =
            "${placemarks.first.locality} , ${placemarks.first.subLocality} , ${placemarks.first.street} , ${placemarks.first.country}";
      });
    }
    print(_address);

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  void initState() {
    getGeoLocationPosition(context);
    super.initState();
  }

  Widget buildTopRestaurantsCard(Restuarnt restuarnt) {
    return buildTopRestaurants(context, false, restuarnt);
  }

  Widget buildListMostPoupla(bool isRecmmondetion, Proudcts proudct) {
    return ProductHoz(
      isRecmmondetion: isRecmmondetion,
      proudct: proudct,
    );
  }

  Widget buildCategories() {
    if (catgories.length == 9) {
      catgories.removeAt(0);
    }
    return Wrap(
      children: catgories.map((e) {
        return Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 20, right: 8),
          child: SizedBox(
            width: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/${e.icon}.png",
                  height: 38,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${e.name}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 13),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  void showModal(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              height: MediaQuery.of(context).size.height - 100,
              child: const ScanQrCode());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffFFFDF8),
            Color(0xffFFE1D1),
          ],
        )),
        child: SizedBox(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, top: 10, right: 15),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/location.svg",
                                  height: 24,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Deliver to",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xffC7C7C7)),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              180,
                                          child: Text(
                                            _address,
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Icon(
                                          CupertinoIcons.arrow_down,
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          showModal(context);
                                        },
                                        child: SvgPicture.asset(
                                            "assets/icons/scan.svg")),
                                    InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return const CartScreen();
                                          }));
                                        },
                                        child: SvgPicture.asset(
                                            "assets/icons/Bag.svg")),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SearchField(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Special Offers",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Image.asset(
                                          "assets/icons/wrapped-gift_1f381.jpg")
                                    ],
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "View All",
                                        style: TextStyle(
                                            color: Color(0xffFF9C3C),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14),
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Image.asset(
                                'assets/images/banner.png',
                                width: MediaQuery.of(context).size.width - 40,
                                fit: BoxFit.fill,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    "Top Categories",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "View All",
                                    style: TextStyle(
                                        color: Color(0xffFF9C3C),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: buildCategories(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Most Popular",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset("assets/icons/most.png")
                                ],
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "View All",
                                    style: TextStyle(
                                        color: Color(0xffFF9C3C),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 290,
                          child: ListView.builder(
                              itemCount: products.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    buildListMostPoupla(false, products[index]),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    "Top Restaurants",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "View All",
                                    style: TextStyle(
                                        color: Color(0xffFF9C3C),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 220,
                          child: ListView.builder(
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
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    "Recommended For You",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "View All",
                                    style: TextStyle(
                                        color: Color(0xffFF9C3C),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ))
                            ],
                          ),
                        ),
                        buildListCategories(catgories),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: SizedBox(
                              child: GridView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.height /
                                            1.30),
                                    crossAxisSpacing: 0.2,
                                    mainAxisSpacing: 11.0),
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  buildListMostPoupla(true, products[index]),
                                ],
                              );
                            },
                          )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
