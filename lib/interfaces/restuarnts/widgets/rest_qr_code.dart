import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class RestQrCode extends StatefulWidget {
  const RestQrCode({super.key});

  @override
  State<RestQrCode> createState() => _RestQrCodeState();
}

class _RestQrCodeState extends State<RestQrCode> {
  saveQrCode() async {
    try {
      var response = await http.get(Uri.parse(
          "https://cdn.britannica.com/17/155017-050-9AC96FC8/Example-QR-code.jpg"));
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      File file = new File(join(documentDirectory.path, 'qr-code.png'));
      file.writeAsBytesSync(response.bodyBytes);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffFFFDF8),
                Color(0xffFFE1D1),
              ],
            )),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 3,
                    width: 75,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Image.asset(
                    "assets/images/qr-code.png",
                    height: 183,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 44,
                    width: (MediaQuery.of(context).size.width - 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1, color: const Color(0xffFA5B01)),
                        color: Colors.transparent),
                    child: MaterialButton(
                      color: Colors.transparent,
                      elevation: 0,
                      onPressed: () {
                        saveQrCode();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/import.svg"),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Save on your device",
                            style: TextStyle(
                                fontSize: 15, color: Color(0xffFA5B01)),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 44,
                    width: (MediaQuery.of(context).size.width - 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffFA5B01)),
                    child: MaterialButton(
                      color: Colors.transparent,
                      elevation: 0,
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/send.svg"),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Share",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
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
