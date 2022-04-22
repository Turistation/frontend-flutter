// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:touristation/shared/theme.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final double width;
  final Function() onPressed;

  const CustomButton({ 
  Key? key,
  required this.text,
  this.width = 197,
  required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: keyOrangeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(text, style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}