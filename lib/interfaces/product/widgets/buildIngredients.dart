


import 'package:flutter/material.dart';
import 'package:orayemem/consts/consts.dart';

class BuildIngredients extends StatefulWidget {
  const BuildIngredients({super.key});

  @override
  State<BuildIngredients> createState() => _BuildIngredientsState();
}

class _BuildIngredientsState extends State<BuildIngredients> {
 Widget buildIngredients() {
    return Wrap(
      children: ingredients.map((e) {
        return FittedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 0, bottom: 20, right: 20),
            child: InkWell(
              onTap: () {
                setState(() {
                  e["isSelected"] = !e["isSelected"];
                });
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: e["isSelected"]
                            ? const Color(0xffFA5B01)
                            : const Color(0xffD1CBBB)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/${e["src"]}.png",
                      height: 18,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${e["name"]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildIngredients();
  }
}