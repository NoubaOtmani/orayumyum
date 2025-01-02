import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orayemem/interfaces/restuarnts/restuarnts.dart';
import 'package:orayemem/models/restuarnts.dart';

Widget buildTopRestaurants(
    BuildContext context, bool isFav, Restuarnt restuarnt) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return  RestuarntScreen(
          restuarnt: restuarnt,
        );
      }));
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        width: isFav ? MediaQuery.of(context).size.width - 50 : 299,
        height: 195,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 12,
                offset: const Offset(0, 7),
                color: const Color(0xffE2D9C252).withOpacity(0.14)),
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 115,
                  width: isFav ? MediaQuery.of(context).size.width - 50 : 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(restuarnt.cover ?? ""),
                          fit: BoxFit.cover)),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 25,
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 6,
                                        offset: const Offset(0.0, 6),
                                        color: const Color(0xff00000029)
                                            .withOpacity(0.16)),
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/clock.svg",
                                        color: const Color(0xffFF9C3C),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        "25 - 30 min",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 25,
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
                                    size: 17,
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
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    restuarnt.profile ?? "",
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
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          restuarnt.restuarnt_name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SvgPicture.asset(
                          "assets/icons/star.svg",
                          color: const Color(0xffEEC110),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          restuarnt.rating.toString(),
                          style: const TextStyle(
                              color: Color(0xffD8D8D8), fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/location.svg",
                          color: const Color(0xffD8D8D8),
                        ),
                        Text(
                          restuarnt.address,
                          style: const TextStyle(
                              color: Color(0xffD8D8D8), fontSize: 12),
                        ),
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
  );
}
