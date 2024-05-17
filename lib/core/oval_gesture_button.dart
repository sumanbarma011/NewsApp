
import 'package:flutter/material.dart';

class OvalGestureButton extends StatelessWidget {
  const OvalGestureButton(
      {super.key,
      required this.text,
      required this.backgroundColorBtn,
      required this.textColor,
      required this.textSize,
      required this.horizontalPadding,
      required this.verticalPadding,
      this.onTap});
  final String text;
  final Color backgroundColorBtn;
  final Color textColor;
  final double textSize;
  final double horizontalPadding;
  final double verticalPadding;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        decoration: BoxDecoration(
          color: backgroundColorBtn,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}