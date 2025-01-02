import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orayemem/interfaces/Favorites/favorites.dart';
import 'package:orayemem/interfaces/profil/pages/invite_friends.dart';
import 'package:orayemem/interfaces/profil/pages/notfications.dart';
import 'package:orayemem/interfaces/profil/widgets/logout.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Widget buildSettingListTile(
      String icon, String text, VoidCallback callBackBack) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              callBackBack();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/$icon.svg",
                      height: 24,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                          color: Color(0xff292D32), fontSize: 15),
                    )
                  ],
                ),
                SvgPicture.asset("assets/icons/arrow-right.svg"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showModal(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffFFFDF8),
                    Color(0xffFFE1D1),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 188,
              child: const LogOut());
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/profile.svg",
                              height: 24,
                              color: const Color(0xffFA5B01),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Profile",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 00.0),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "assets/images/me.jpeg"))),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Rostomy hs",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "0770 17 17 95",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff877D61)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset("assets/icons/arrow-right.svg"),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0xffF3EEE0),
                      height: 1,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    buildSettingListTile("heart", "Favorites", () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const FavoritesScreen();
                      }));
                    }),
                    buildSettingListTile("discount-shape-outLine",
                        "Special Offers & Promo", () {}),
                    buildSettingListTile("locationOutLine", "Addresses", () {}),
                    buildSettingListTile("notificationOutLine", "Notifications",
                        () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const NotificationsSeetingsScreen();
                      }));
                    }),
                    buildSettingListTile("global", "Language", () {}),
                    buildSettingListTile("info-circle", "Help Center", () {}),
                    buildSettingListTile("peopleOutLine", "Invite Friends", () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const InviteFriends();
                      }));
                    }),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              showModal(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/login.svg",
                                      height: 24,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    const Text(
                                      "Logout",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 15),
                                    )
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
        ),
      ),
    );
  }
}
