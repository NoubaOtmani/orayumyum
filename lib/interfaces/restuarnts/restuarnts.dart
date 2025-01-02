import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orayemem/consts/consts.dart';
import 'package:orayemem/interfaces/offers/offers.dart';
import 'package:orayemem/interfaces/restuarnts/location.dart';
import 'package:orayemem/interfaces/restuarnts/widgets/rest_qr_code.dart';
import 'package:orayemem/interfaces/reviews/reviews.dart';
import 'package:orayemem/interfaces/widgets/categories_list_hor.dart';
import 'package:orayemem/interfaces/widgets/product_hoz.dart';
import 'package:orayemem/models/categories.dart';
import 'package:orayemem/models/products.dart';
import 'package:orayemem/models/restuarnts.dart';

class RestuarntScreen extends StatefulWidget {
  final Restuarnt restuarnt;
  const RestuarntScreen({super.key, required this.restuarnt});

  @override
  State<RestuarntScreen> createState() => _RestuarntScreenState();
}

class _RestuarntScreenState extends State<RestuarntScreen> {
  getMyCategories() {
    List<Categories> newList = [];
    for (var i = 0; i < widget.restuarnt.menu.length; i++) {
      final category = catgories
          .where((element) => element.id == widget.restuarnt.menu[i])
          .first;
      print(category);
      newList.add(category);
    }
    return newList;
  }

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

  Widget buildCardIcon(String text, String iconName, VoidCallback callback) {
    return Container(
      height: 74,
      width: 77.74,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffFEF7E8)),
      child: MaterialButton(
        padding: const EdgeInsets.all(12),
        onPressed: () {
          callback();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/${iconName}.svg"),
            const SizedBox(
              height: 7,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Color(0xff877D61),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListMostPoupla(bool isRecmmondetion, Proudcts proudct) {
    return ProductHoz(
      isRecmmondetion: isRecmmondetion,
      proudct: proudct,
    );
  }
  //

  void showModal(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              height: MediaQuery.of(context).size.height - 100,
              child: const RestQrCode());
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
              primary: false,
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
                                  image: NetworkImage(
                                      widget.restuarnt.cover ?? ""),
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
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                padding: EdgeInsets.zero,
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
                              child: Column(
                                children: [
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
                                                  color: Color(0xff33A952)),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            const Text(
                                              "CLOSED AT 22:00",
                                              style: TextStyle(
                                                  color: Color(0xff877D61)),
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
                                        Row(
                                          children: [
                                            buildCardIcon(
                                                widget.restuarnt.rating
                                                    .toString(),
                                                "ranking", () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return const ReviewsScreen();
                                              }));
                                            }),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            buildCardIcon("2.3 KM", "location",
                                                () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return LocationScreen(
                                                  restuarnt: widget.restuarnt,
                                                );
                                              }));
                                            }),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            buildCardIcon(
                                                "OFFERS", "discount-shape", () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return const OffersScreen();
                                              }));
                                            }),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                showModal(context);
                                              },
                                              child: Container(
                                                height: 74,
                                                width: 77.74,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: const Color(
                                                        0xffFEF7E8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/qr-code.png",
                                                      height: 53.07,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
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
                                                  color: Color(0xffD1CBBB)),
                                            )),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          "For you",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 290,
                                    child: ListView.builder(
                                        itemCount: products.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return buildListMostPoupla(
                                              false, products[index]);
                                        }),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  buildListCategories(getMyCategories()),
                                  SizedBox(
                                      child: GridView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: products.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio:
                                                MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    (MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        1.30),
                                            crossAxisSpacing: 0.5,
                                            mainAxisSpacing: 1.0),
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
                                  const SizedBox(
                                    height: 50,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
                              image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/icons/images.jpeg',
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
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
