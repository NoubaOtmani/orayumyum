import 'package:flutter/material.dart';
import 'package:orayemem/consts/consts.dart';
import 'package:orayemem/models/categories.dart';

Widget buildListCategories(List categories) {
  if (categories.length == 8) {
    categories
        .add(Categories(name: "All", id: 10, icon: null, isSelected: false));
    categories.sort((a, b) => a.name.compareTo(b.name));
  }

  return Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: SizedBox(
      height: 50,
      child: ListView.builder(
          itemCount: categories.length,
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
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            border: Border.all(
                              width: 1.5,
                              color: categories[index].isSelected == true
                                  ? Colors.transparent
                                  : const Color(0xffFA5B01),
                            ),
                            gradient: LinearGradient(
                                colors: categories[index].isSelected == true
                                    ? []
                                    : [
                                        const Color(0xffFC7B00),
                                        const Color(0xffF95100),
                                      ])),
                        child: Row(
                          children: [
                            SizedBox(
                              child: categories[index].icon == null
                                  ? const SizedBox(
                                      width: 0,
                                    )
                                  : Image.asset(
                                      "assets/icons/${categories[index].icon}.png",
                                      height: 18.02,
                                    ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${categories[index].name}",
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

Widget buildSearchListCategories() {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: Wrap(
      children: recentSearch.map((e) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0, bottom: 10),
              child: SizedBox(
                width: 96,
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
                              color: const Color(0xffFA5B01),
                            ),
                            gradient: LinearGradient(colors: [
                              const Color(0xffFC7B00),
                              const Color(0xffF95100),
                            ])),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${e["name"]}",
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
            ),
          ],
        );
      }).toList(),
    ),
  );
}
