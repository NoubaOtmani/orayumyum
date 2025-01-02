import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orayemem/consts/consts.dart';
import 'package:orayemem/interfaces/checkout/widgets/map.dart';
import 'package:orayemem/interfaces/finding_driver/finding_driver.dart';
import 'package:orayemem/interfaces/widgets/button.dart';
import 'package:orayemem/models/products.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<Map<String, dynamic>> delivery_types = [
    {
      "type": "Standard",
      "duree": "25-35 min",
      "charge": null,
      "isSelected": true,
    },
    {
      "type": "Express",
      "duree": "10-15 min",
      "charge": "+100 DA",
      "isSelected": false,
    },
    {
      "type": "Pick up",
      "duree": null,
      "charge": null,
      "isSelected": false,
    },
  ];

  double getTotalPrice() {
    print(cart);
    double total_price = 0;
    for (var i = 0; i < cart.length; i++) {
      total_price = total_price + (cart[i]["food"]["prix"] * cart[i]["qnt"]);
    }
    return total_price;
  }

  Widget buildOrderDeliveryType() {
    return SizedBox(
      height: 70,
      child: ListView.builder(
          itemCount: delivery_types.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      delivery_types.forEach((element) {
                        setState(() {
                          element["isSelected"] = false;
                        });
                      });
                      setState(() {
                        delivery_types[index]["isSelected"] =
                            !delivery_types[index]["isSelected"];
                      });
                    },
                    child: Container(
                      height: 59,
                      width: 186.62,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: delivery_types[index]["isSelected"]
                                  ? const Color(0xffFA5B01)
                                  : const Color(0xffD1CBBB)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${delivery_types[index]["type"]}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    child:
                                        delivery_types[index]["charge"] == null
                                            ? const SizedBox(
                                                height: 0,
                                              )
                                            : Text(
                                                "${delivery_types[index]["charge"]}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13),
                                              ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                child:  delivery_types[index]["duree"] == null
                                            ? Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SvgPicture.asset(
                                      "assets/icons/user.svg",
                                      color: const Color(0xffB8B8B8),
                                      height: 14,
                                    ),
                                              ],
                                            ) : Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/clockFill.svg",
                                      color: const Color(0xffB8B8B8),
                                      height: 14,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      delivery_types[index]["duree"],
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Color(0xffB8B8B8),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 44,
                  child: CustomButton(
                      text: "Place Order ${getTotalPrice() + 100} DA",
                      callBack: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return  FindingDriverScreen();
                        }));
                      }),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0.0, right: 20, top: 20),
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
                        "Checkout Orders",
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
                SizedBox(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MapCheckout(),
                        const SizedBox(
                          height: 30,
                        ),
                        buildOrderDeliveryType(),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Items",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                            itemCount: cart.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              Proudcts proudct = Proudcts.fomJson(
                                cart[index]["food"],
                              );
                              return Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 15.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0, left: 10, top: 12),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                          proudct.image,
                                                        )),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        proudct.food_name,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(
                                                        "${proudct.prix} DA",
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xffFA5B01)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 92,
                                                  height: 38,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffFBEAD6),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            if (cart[index]["qnt"] != 1) {
                                                              setState(() {
                                                                cart[index]["qnt"] = cart[index]["qnt"] - 1;
                                                              });
                                                            }
                                                          },
                                                          child: const Icon(
                                                            Icons.remove,
                                                            color: Colors.black,
                                                            size: 17,
                                                          ),
                                                        ),
                                                        Text(
                                                          '${cart[index]["qnt"]}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 16),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              cart[index]["qnt"] = cart[index]["qnt"] + 1;
                                                            });
                                                          },
                                                          child: const Icon(
                                                            Icons.add,
                                                            size: 17,
                                                            color: Color(
                                                                0xffFA5B01),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
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
                                ],
                              );
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Subtotal",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Color(0xffD1CBBB)),
                            ),
                            Text(
                              "${getTotalPrice()} DA",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 13),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Fee",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Color(0xffD1CBBB)),
                            ),
                            Text(
                              "100 DA",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 13),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: const Color(0xffF2E1D4),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              "${getTotalPrice() + 100} DA",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
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
