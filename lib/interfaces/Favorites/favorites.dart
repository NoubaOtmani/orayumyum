import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orayemem/consts/consts.dart';
import 'package:orayemem/interfaces/widgets/product_hoz.dart';
import 'package:orayemem/interfaces/widgets/restuarnt.dart';
import 'package:orayemem/models/products.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  Widget buildListMostPoupla(bool isRecmmondetion, Proudcts proudct) {
    return ProductHoz(
      isRecmmondetion: isRecmmondetion,
      proudct: proudct,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
              child: Container(
                child: SafeArea(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset("assets/icons/Back.svg")),
                          const Text(
                            "Favorites",
                            style: TextStyle(
                                color: Color(0xff292D32),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SegmentedTabControl(
                              radius: Radius.circular(10),
                              backgroundColor: Color(0xffF6F0DF),
                              tabTextColor: Colors.black45,
                              selectedTabTextColor: Colors.white,
                              indicatorPadding: EdgeInsets.all(5),
                              squeezeIntensity: 2,
                              height: 44,
                              tabPadding: EdgeInsets.symmetric(horizontal: 5),
                              textStyle: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff877D61)),
                              tabs: [
                                SegmentTab(
                                    label: 'Restaurants',
                                    gradient: LinearGradient(colors: [
                                      Color(0xffFC7B00),
                                      Color(0xffF95100)
                                    ])),
                                SegmentTab(
                                  label: 'Foods',
                                  gradient: LinearGradient(colors: [
                                    Color(0xffFC7B00),
                                    Color(0xffF95100)
                                  ]),
                                  textColor: Colors.black26,
                                ),
                              ],
                            ),
                          ),
                          // Sample pages
                          Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: TabBarView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                SizedBox(
                                  child: ListView.separated(
                                    itemCount: restuarnts.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          buildTopRestaurants(
                                              context, true, restuarnts[index]),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 20,
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                    child: GridView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: products.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.80,
                                          crossAxisSpacing: 0.5,
                                          mainAxisSpacing: 14.0),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        buildListMostPoupla(
                                            true, products[index]),
                                      ],
                                    );
                                  },
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ))),
    );
  }
}
