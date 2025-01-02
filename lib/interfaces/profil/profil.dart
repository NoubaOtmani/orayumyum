import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orayemem/interfaces/home/routing.dart';
import 'package:orayemem/interfaces/widgets/button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? profile_picture;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);

      setState(() {
        profile_picture = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Widget buildInputs(String hinText, String iconName) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        height: 44,
        width: MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 6),
            prefixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 20,
                    child: SvgPicture.asset(
                      'assets/icons/$iconName.svg',
                      width: 20,
                    )),
              ],
            ),
            border: InputBorder.none,
            hintText: hinText,
            hintStyle: const TextStyle(
                color: Color(0xffDFDFDF),
                fontWeight: FontWeight.w400,
                fontSize: 15),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xffFA4A00), width: 1.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }

  int selectedOption = 1;
  buildGenderSelector() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 58,
            width: 166.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(
                width: 1,
                color:
                    selectedOption == 1 ? Color(0xffFA5B01) : Color(0xffF1F1F1),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Radio(
                      value: 1,
                      focusColor: const Color(0xffFA5B01),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return const Color(0xffFA5B01);
                      }),
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value ?? 1;
                          print("Button value: $value");
                        });
                      },
                    ),
                    const Text(
                      'Male',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 58,
            width: 166.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(
                width: 2,
                color: selectedOption == 2
                    ? const Color(0xffFA5B01)
                    : const Color(0xffF1F1F1),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Radio(
                      value: 2,
                      focusColor: Color(0xffFA5B01),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return Color(0xffFA5B01);
                      }),
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value ?? 2;
                          print("Button value: $value");
                        });
                      },
                    ),
                    const Text(
                      'Famele',
                      style: TextStyle(fontSize: 15),
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
      body: SafeArea(
        child: Container(
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
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
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
                            "Fill Your Profile Screene",
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
                      height: 50,
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Stack(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: profile_picture != null
                                  ? DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(
                                          profile_picture ?? File("path")))
                                  : null,
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 5.0, right: 5),
                              child: Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                  shape: BoxShape.circle,
                                  gradient: const LinearGradient(colors: [
                                    Color(0xffFC7B00),
                                    Color(0xffF95100),
                                  ]),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          pickImage();
                                        },
                                        child: SvgPicture.asset(
                                            "assets/icons/edit.svg"))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Personal Informations",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          buildInputs("Name", "user"),
                          buildInputs("Last name", "user"),
                          buildInputs("Date of Birthday", "calendar"),
                          const SizedBox(
                            height: 15,
                          ),
                          buildGenderSelector(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Account Informations",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        buildInputs("Your Email", "sms"),
                        buildInputs("Password", "lock"),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      text: "Continue",
                      callBack: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const RoutingScreen();
                        }));
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
