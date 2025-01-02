import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<Map<String, dynamic>> list1 = [
    {
      "title": "Recommended",
      "isSelected": false,
    },
    {
      "title": "Rating",
      "isSelected": false,
    },
    {
      "title": "Distance",
      "isSelected": false,
    },
    {
      "title": "Popularity",
      "isSelected": false,
    },
  ];

  List<Map<String, dynamic>> list3 = [
    {
      "title": "Delivery",
      "isSelected": false,
    },
    {
      "title": "Self Pick-Up",
      "isSelected": false,
    },
  ];

  List<Map<String, dynamic>> list2 = [
    {
      "title": "Promo",
      "isSelected": false,
    },
    {
      "title": "Priority Restaurant",
      "isSelected": false,
    },
    {
      "title": "Small MSME Restaurant",
      "isSelected": false,
    },
  ];

  List<Map<String, dynamic>> list4 = [
    {
      "title": "Burger",
      "isSelected": false,
    },
    {
      "title": "Pizza",
      "isSelected": false,
    },
    {
      "title": "Noodls",
      "isSelected": false,
    },
    {
      "title": "Meat",
      "isSelected": false,
    },
    {
      "title": "Vegetarien",
      "isSelected": false,
    },
    {
      "title": "Dessert",
      "isSelected": false,
    },
    {
      "title": "Drink",
      "isSelected": false,
    },
    {
      "title": "Bread",
      "isSelected": false,
    },
    {
      "title": "Croissant",
      "isSelected": false,
    },
    {
      "title": "Pancakes",
      "isSelected": false,
    },
    {
      "title": "Cheese",
      "isSelected": false,
    },
    {
      "title": "French Fries",
      "isSelected": false,
    },
    {
      "title": "Sandwich",
      "isSelected": false,
    },
    {
      "title": "Taco",
      "isSelected": false,
    },
    {
      "title": "Pot of Food",
      "isSelected": false,
    },
    {
      "title": "Salade",
      "isSelected": false,
    },
    {
      "title": "Bento",
      "isSelected": false,
    },
    {
      "title": "Rice",
      "isSelected": false,
    },
    {
      "title": "Sushi",
      "isSelected": false,
    },
    {
      "title": "Cookies",
      "isSelected": false,
    },
  ];

  Widget buildFilterCard(
    List<Map<String, dynamic>> list,
    String title,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xffD1CBBB24).withOpacity(0.14),
                          blurRadius: 12,
                          offset: const Offset(0, 7))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${title}",
                        style: const TextStyle(
                            color: Color(0xff292D32),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Wrap(
                        children: list.map((e) {
                          return FittedBox(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 15.0, bottom: 5),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        e["isSelected"] = !e["isSelected"];
                                      });
                                    },
                                    child: Container(
                                      height: 14,
                                      width: 14,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1.5,
                                            color: const Color(0xffFA5B01)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            child: !e["isSelected"]
                                                ? const SizedBox(
                                                    height: 0,
                                                  )
                                                : Container(
                                                    height: 8,
                                                    width: 8,
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Color(
                                                                0xffFA5B01)),
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(e["title"])
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close,
                              color: Color(0xff292D32),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Filter",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      buildFilterCard(list1, "Sort By"),
                      buildFilterCard(list2, "Restaurant"),
                      buildFilterCard(list3, "Mode"),
                      buildFilterCard(list4, "Category"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
