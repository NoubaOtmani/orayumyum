import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orayemem/interfaces/widgets/button.dart';

class InviteFriends extends StatefulWidget {
  const InviteFriends({super.key});

  @override
  State<InviteFriends> createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  List<Map<String, dynamic>> friends = [
    {"username": "Raid Djehaiche", "phone_number": "0770 17 17 95"},
    {"username": "Islam Arfaoui", "phone_number": "0560 87 14 92"},
    {"username": "Ibrahim Hemmak", "phone_number": "0787 14 23 98"},
    {"username": "Marwan Djehaiche", "phone_number": "0550 23 54 71"},
    {"username": "Oualid Senina", "phone_number": "0666 12 47 82"},
  ];

  Widget buildCardFriends(Map<String, dynamic> friend) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffF3EEE0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          friend["username"]
                              .toString()
                              .substring(0, 2)
                              .toUpperCase(),
                          style: const TextStyle(
                              fontSize: 14, color: Color(0xff877D61)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        friend["username"],
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        friend["phone_number"],
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff877D61)),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 26,
                width: 78,
                child: MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xffFE8C00),
                        Color(0xffF83600),
                      ]),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Container(
                      height: 52,
                      width: MediaQuery.of(context).size.width - 40,
                      alignment: Alignment.center,
                      child: const Text(
                        "Invite",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              )
            ],
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
          child: SafeArea(
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: Column(
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
                            "Invite Friends",
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
                    ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: friends.length,
                        itemBuilder: (context, index) {
                          return buildCardFriends(friends[index]);
                        })
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
