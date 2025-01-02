import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommentsSectionScreen extends StatefulWidget {
  const CommentsSectionScreen({super.key});

  @override
  State<CommentsSectionScreen> createState() => _CommentsSectionScreenState();
}

class _CommentsSectionScreenState extends State<CommentsSectionScreen> {
  Widget buildUserComment(bool isCommentReply) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: isCommentReply ? 30 : 40,
          width: isCommentReply ? 30 : 40,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/me.jpeg"), fit: BoxFit.cover),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  "Raid Djehaiche ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "2d ",
                  style: TextStyle(
                      color: Color(0xffC1C1C1),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            const Text(
              "What a wonderful dinner!",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {},
                    child: const Text(
                      "Reply",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffFA5B01),
                          fontWeight: FontWeight.bold),
                    )),
              ],
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffFFFDF8),
            Color(0xffFFE1D1),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20, right: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).size.height / 2.25,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/me.jpeg"),
                                    fit: BoxFit.cover),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      "Raid Djehaiche ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "2d ",
                                      style: TextStyle(
                                          color: Color(0xffC1C1C1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                const Text(
                                  "What a wonderful dinner!",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Reply",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xffFA5B01),
                                              fontWeight: FontWeight.bold),
                                        )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    buildUserComment(true),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          "assets/icons/heartFill.svg",
                          color: Colors.red,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xffE2D9C2),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 44,
                width: MediaQuery.of(context).size.width - 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffFFFFFF)),
                child: TextFormField(
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 5, left: 15),
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xffBEBEBE),
                          fontSize: 13),
                      hintText: "Add a comment for Le Cartel San...",
                      border: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
