import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

Widget customButton(String text, Callback action, Color color,Color textColor) {
  return TextButton(
    onPressed: action,
    style: ElevatedButton.styleFrom(backgroundColor: color),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
    ),
  );
}
