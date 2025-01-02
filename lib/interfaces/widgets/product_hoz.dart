

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orayemem/interfaces/product/products.dart';
import 'package:orayemem/models/products.dart';

class ProductHoz extends StatelessWidget {
  final bool isRecmmondetion;
  final Proudcts proudct;
  const ProductHoz({super.key, required this.isRecmmondetion, required this.proudct});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return ProductScreen(proudct: proudct);
          }));
        },
        child: Container(
          width: 190,
          height: 280,
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 170,
                  width: 170,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        
                          image: NetworkImage(proudct.image),
                          fit: BoxFit.cover)),
                  child: Stack(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: !isRecmmondetion
                                  ? Container(
                                      height: 25,
                                      width: 71,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(colors: [
                                          Color(0xffFC7B00),
                                          Color(0xffF95100)
                                        ]),
                                      ),
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "PROMO",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xffFFFFFF),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(
                                      height: 25,
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icons/star.svg",
                                                color: const Color(0xffFF9C3C),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                               Text(
                                                proudct.rating.toString(),
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/icons/heart.svg")
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image:  DecorationImage(
                                image: NetworkImage(
                                  proudct.profile ?? "",
                                ),
                                fit: BoxFit.cover),
                            border: Border.all(
                              width: 6,
                              color: Colors.white,
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
               Text(
                proudct.food_name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/clock.svg"),
                  const SizedBox(
                    width: 5,
                  ),
                   Text(
                    "${proudct.deliver_time.toString()} min ",
                    style: const TextStyle(color: Color(0xffB8B8B8), fontSize: 12),
                  ),
                  const Text(
                    " | Sandwich",
                    style: TextStyle(color: Color(0xffB8B8B8), fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
               Text(
                "${proudct.prix} DA",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFA5B01),
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}