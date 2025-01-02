import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsSeetingsScreen extends StatefulWidget {
  const NotificationsSeetingsScreen({super.key});

  @override
  State<NotificationsSeetingsScreen> createState() =>
      _NotificationsSeetingsScreenState();
}

class _NotificationsSeetingsScreenState
    extends State<NotificationsSeetingsScreen> {
  List<Map<String, dynamic>> options = [
    {
      "title": "General Norifications",
      "isSelected": false,
    },
    {
      "title": "Sound",
      "isSelected": false,
    },
    {
      "title": "Vibrate",
      "isSelected": false,
    },
    {
      "title": "Special Offers",
      "isSelected": false,
    },
    {
      "title": "Promo & Discount",
      "isSelected": false,
    },
    {
      "title": "Payment",
      "isSelected": false,
    },
    {
      "title": "App Update",
      "isSelected": false,
    },
    {
      "title": "New Service Available",
      "isSelected": false,
    },
  ];

  Widget optionsWidget() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: options.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      options[index]["title"],
                      style: const TextStyle(
                          fontSize: 15, color: Color(0xff000000)),
                    ),
                    Switch(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      trackOutlineColor:
                          MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                        return Colors.transparent;
                      }),
                      activeColor: const Color(0xffFA4A00),
                      activeTrackColor: const Color(0xffF6F0DF),
                      inactiveThumbColor: const Color(0xffD4CCB8),
                      inactiveTrackColor: const Color(0xffF6F0DF),
                      value: options[index]["isSelected"],
                      onChanged: (value) {
                        setState(() {
                          options[index]["isSelected"] = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
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
        child: SingleChildScrollView(
          child: Center(
            child: SafeArea(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, right: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset("assets/icons/Back.svg")),
                          const Text(
                            "Notifications",
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
                    const SizedBox(
                      height: 40,
                    ),
                    optionsWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
