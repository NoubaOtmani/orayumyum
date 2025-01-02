import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  Widget cardOrder(int orderStatus) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 12,
            offset: const Offset(0, 7),
            color: const Color(0xffF3EEE052).withOpacity(0.14))
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10, top: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/icons/images.jpeg",
                        )),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mixed Pizza",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "450 DA",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFA5B01)),
                      ),
                    ],
                  ),
                ),
                Center(
                    child: orderStatus == 1 || orderStatus == 2
                        ? Container(
                            height: 26,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1,
                                  color: orderStatus == 2
                                      ? const Color(0xffEA4335)
                                      : const Color(0xff33A952)),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    orderStatus == 2 ? "CANCELED" : "COMPLETED",
                                    style: TextStyle(
                                        color: orderStatus == 2
                                            ? const Color(0xffEA4335)
                                            : const Color(0xff33A952)),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Text("2 ITEMS"))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: orderStatus == 2
                ? const SizedBox(
                    height: 0,
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        width: (MediaQuery.of(context).size.width - 30) / 2.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1, color: const Color(0xffFA5B01)),
                            color: Colors.transparent),
                        child: MaterialButton(
                          color: Colors.transparent,
                          elevation: 0,
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: orderStatus == 1
                                    ? const SizedBox(
                                        height: 0,
                                      )
                                    : const Icon(
                                        Icons.close,
                                        color: Color(0xffFA5B01),
                                      ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                orderStatus == 1
                                    ? "leave a review"
                                    : "Cancel Order",
                                style: const TextStyle(
                                    fontSize: 12, color: Color(0xffFA5B01)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: (MediaQuery.of(context).size.width - 30) / 2.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffFA5B01)),
                        child: MaterialButton(
                          color: Colors.transparent,
                          elevation: 0,
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: orderStatus == 1
                                    ? const SizedBox(
                                        height: 0,
                                      )
                                    : const Icon(
                                        Icons.location_history,
                                        color: Colors.white,
                                      ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                orderStatus == 1
                                    ? "Order Again"
                                    : "Track driver",
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
          SizedBox(
            height: orderStatus == 2 ? 0 : 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Container(
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 10),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/notification-status.svg",
                            height: 24,
                            color: const Color(0xffFA5B01),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Orders",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
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
                          backgroundColor: const Color(0xffF6F0DF),
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
                                label: 'Avtive',
                                gradient: LinearGradient(colors: [
                                  Color(0xffFC7B00),
                                  Color(0xffF95100)
                                ])),
                            SegmentTab(
                              label: 'Completed',
                              gradient: LinearGradient(colors: [
                                Color(0xffFC7B00),
                                Color(0xffF95100)
                              ]),
                              textColor: Colors.black26,
                            ),
                            SegmentTab(
                              label: 'Canceled',
                              gradient: LinearGradient(colors: [
                                Color(0xffFC7B00),
                                Color(0xffF95100),
                              ]),
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
                            Column(
                              children: [
                                cardOrder(0),
                              ],
                            ),
                            Column(
                              children: [
                                cardOrder(1),
                              ],
                            ),
                            Column(
                              children: [
                                cardOrder(2),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
