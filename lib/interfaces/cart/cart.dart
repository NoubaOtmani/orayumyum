import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orayemem/consts/consts.dart';
import 'package:orayemem/interfaces/checkout/checkout.dart';
import 'package:orayemem/interfaces/widgets/button.dart';
import 'package:orayemem/interfaces/widgets/product_hoz.dart';
import 'package:orayemem/models/products.dart';
import 'package:pinput/pinput.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 44,
                  child: CustomButton(
                      text: "Checkout",
                      callBack: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return  CheckoutScreen();
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
        child: SizedBox(
          child: SingleChildScrollView(
            child: SizedBox(
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15.0, right: 20, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset("assets/icons/Back.svg")),
                          const Text(
                            "My Cart",
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
                      height: 30,
                    ),
                    ListView.builder(
                        itemCount: cart.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Proudcts proudct =
                              Proudcts.fomJson(cart[index]["food"]);
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 30,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 12,
                                            offset: const Offset(0, 7),
                                            color: const Color(0xffF3EEE052)
                                                .withOpacity(0.1))
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10.0, left: 10, top: 12),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    proudct.food_name,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    "${proudct.prix} DA",
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xffFA5B01)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 92,
                                              height: 38,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffFBEAD6),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, right: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        print(
                                                            cart[index]["qnt"]);
                                                        if (cart[index]
                                                                ["qnt"] !=
                                                            1) {
                                                          setState(() {
                                                            cart[index]["qnt"] =
                                                                cart[index][
                                                                        "qnt"] -
                                                                    1;
                                                          });
                                                        }else{
                                                          setState(() {
                                                            cart.removeAt(index);
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
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          cart[index]["qnt"] =
                                                              cart[index]
                                                                      ["qnt"] +
                                                                  1;
                                                        });
                                                      },
                                                      child: const Icon(
                                                        Icons.add,
                                                        size: 17,
                                                        color:
                                                            Color(0xffFA5B01),
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
