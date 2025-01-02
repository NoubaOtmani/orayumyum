import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orayemem/interfaces/widgets/button.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
               decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          
          colors: [
            Color(0xffFFFDF8),
            Color(0xffFFE1D1),
          ],
        )),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom:40.0,top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: 3,
                      width: 75,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Scan QR Code",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: 303,
                      child: Text(
                        "  Place QR Code inside the frame to scan please avoid shake to get results quickly",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xffD8D8D8), fontSize: 15),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/scan.png',
                  fit: BoxFit.fill,
                ),
                 CustomButton(text: "Place Camera Code",callBack: (){},),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
