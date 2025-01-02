import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  Widget buildNotficationCard(int notification_status) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: notification_status == 1
                        ? const Color(0xffE8FBED)
                        : const Color(0xffF9E6E4)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(notification_status == 1
                        ? "assets/icons/bag-2.svg"
                        : "assets/icons/order-canceled.svg")
                    //
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 140,
                        child: Text(
                          notification_status == 1
                              ? "Oreders Successful"
                              : "Oreders Canceled",
                          style: const TextStyle(
                              fontSize: 14, color: Color(0xff292D32)),
                        ),
                      ),
                      InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/icons/more-circle.svg",
                            height: 18,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    "2 April, 2023 - 4:06",
                    style: TextStyle(fontSize: 11, color: Color(0xffD1CBBB)),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "A canceled order is a previously submitted order to buy or sell a security that gets canceled before it executes on an exchange.",
            style: TextStyle(fontSize: 12, color: Color(0xffA7A191)),
          ),
        ],
      ),
    );
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
        child: SingleChildScrollView(
          child: SizedBox(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10),
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
                              "Notifications",
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "New",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        buildNotficationCard(0),
                        buildNotficationCard(1),
                      ],
                    ),
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
