import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';




showToast(String msg, Color bgColor) {
  Fluttertoast.showToast(
    msg: msg,
    textColor: Colors.white,
    backgroundColor: bgColor,
  );
}
