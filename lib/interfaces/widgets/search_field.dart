import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orayemem/interfaces/search/filter.dart';
import 'package:orayemem/interfaces/search/search.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            color: Color(0xffF0F0F0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SearchScreen();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 90,
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 9),
                        prefixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 20,
                                child: SvgPicture.asset(
                                  'assets/icons/search-normal.svg',
                                  width: 20,
                                )),
                          ],
                        ),
                        border: InputBorder.none,
                        hintText: "Search Food, Restaurants...",
                        hintStyle: const TextStyle(
                            color: Color(0xff9D9D9D),
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    height: 19,
                    width: 2,
                    color: const Color(0xffDFDFDF),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const FilterScreen();
                        }));
                      },
                      child: SvgPicture.asset("assets/icons/picture-frame.svg"))
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
