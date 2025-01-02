import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  Widget buildOffersAvailable() {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xffFE8C00), Color(0xffF83600)],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10, bottom: 20, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 50.5,
                  width: 50.5,
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
                Column(
                  children: [
                    const Text(
                      "-25%",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "[ LECARTEL ]",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    MaterialButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.white,
                      onPressed: () {},
                      child: const Text(
                        "order now",
                        style: TextStyle(
                            color: Color(0xffFA5B01),
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0.0, right: 20),
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
                        "Offers Are Available",
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
                buildOffersAvailable()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
