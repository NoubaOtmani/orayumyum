import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback callBack;
  const CustomButton({super.key, required this.text, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        callBack();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xffFE8C00),
            Color(0xffF83600),
          ]),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Container(
          height: 52,
          width: MediaQuery.of(context).size.width - 40,
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
