import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:orayemem/interfaces/widgets/button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  late final _ratingController;
  late double _rating;

  double _userRating = 3.0;
  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  bool _isRTLMode = false;
  bool _isVertical = false;

  IconData? _selectedIcon;

  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController(text: '3.0');
    _rating = _initialRating;
  }

  Widget buildProgressInd(
    String text,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: LinearPercentIndicator(
              width: 146,
              animation: true,
              lineHeight: 5.0,
              animationDuration: 2500,
              percent: 0.8,
              barRadius: const Radius.circular(5),
              backgroundColor: const Color(0xffF3EEE0),
              progressColor: const Color(0xffFA4A00),
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> ratings = [
    {"text": "Sort by", "icon": "sort", "isSelected": false},
    {"text": "5", "icon": "star", "isSelected": false},
    {"text": "4", "icon": "star", "isSelected": false},
    {"text": "3", "icon": "star", "isSelected": false},
    {"text": "2", "icon": "star", "isSelected": false},
    {"text": "1", "icon": "star", "isSelected": false},
  ];

  Widget buildListRatings() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: SizedBox(
        height: 60,
        child: ListView.builder(
            itemCount: ratings.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: SizedBox(
                  height: 40,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.transparent,
                              border: Border.all(
                                width: 1.5,
                                color: ratings[index]["isSelected"]
                                    ? Colors.transparent
                                    : const Color(0xffFA5B01),
                              ),
                              gradient: LinearGradient(
                                  colors: ratings[index]["isSelected"]
                                      ? []
                                      : [
                                          const Color(0xffFC7B00),
                                          const Color(0xffF95100),
                                        ])),
                          child: Row(
                            children: [
                              SizedBox(
                                child: SvgPicture.asset(
                                  "assets/icons/${ratings[index]["icon"]}.svg",
                                  color: Color(0xffFA5B01),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${ratings[index]["text"]}",
                                style: const TextStyle(
                                    color: Color(0xffFA5B01),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget buildComments() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/me.jpeg"))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Rostomy hs",
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
                RatingBarIndicator(
                  rating: 4,
                  itemCount: 6,
                  itemSize: 12.0,
                  physics: const BouncingScrollPhysics(),
                  itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
                  itemBuilder: (context, _) => const Icon(
                    FontAwesomeIcons.solidStar,
                    color: Color(0xffFBBC05),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            width: 390,
            child: Text(
              "This cozy restaurant has left the best impressions! Hospitable hosts, delicious dishes, beautiful presentation, wide wine list and wonderful dessert. I recommend to everyone! I would like to come back here again and again.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 12, color: Color(0xffA7A191)),
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
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffFFFDF8),
                      Color(0xffFFE1D1),
                    ],
                  )),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    const Text(
                      "Write a Review",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RatingBar.builder(
                      initialRating: _initialRating,
                      minRating: 1,
                      direction: _isVertical ? Axis.vertical : Axis.horizontal,
                      allowHalfRating: true,
                      unratedColor: const Color(0xffF3EEE0),
                      itemCount: 5,
                      itemSize: 25.0,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 7.0),
                      itemBuilder: (context, _) => Icon(
                        _selectedIcon ?? FontAwesomeIcons.solidStar,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          _rating = rating;
                        });
                      },
                      updateOnDrag: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 132,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffF3EEE0),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: 20, bottom: 20, left: 20, right: 20),
                            border: InputBorder.none,
                            hintText: "type something ......",
                            hintStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(text: "Submit", callBack: () {})
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: "Write a Review",
                callBack: () {
                  showModal(context);
                },
              )
            ],
          ),
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
          child: SafeArea(
            child: SingleChildScrollView(
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
                          "Customer Reviews",
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text(
                                "4.7",
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            RatingBar.builder(
                              initialRating: _initialRating,
                              minRating: 1,
                              direction:
                                  _isVertical ? Axis.vertical : Axis.horizontal,
                              allowHalfRating: true,
                              unratedColor: const Color(0xffF3EEE0),
                              itemCount: 5,
                              itemSize: 18.0,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 7.0),
                              itemBuilder: (context, _) => Icon(
                                _selectedIcon ?? FontAwesomeIcons.solidStar,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                setState(() {
                                  _rating = rating;
                                });
                              },
                              updateOnDrag: true,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0, bottom: 5),
                              child: Text(
                                "(135 Reviews)",
                                style: TextStyle(
                                    color: Color(0xffD1CBBB),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 123,
                          width: 2,
                          color: const Color(0xffF3EEE0),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            buildProgressInd("5"),
                            buildProgressInd("4"),
                            buildProgressInd("3"),
                            buildProgressInd("2"),
                            buildProgressInd("1"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  buildListRatings(),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return buildComments();
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
