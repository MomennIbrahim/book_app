import 'package:apps_flutter/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.backGroundColor,
    this.borderRadius,
    required this.textColor,
    required this.onPressed,
  });

  final String text;
  final Color backGroundColor;
  final BorderRadius? borderRadius;
  final Color textColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: backGroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(16.0))),
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: Styles.textStyle16.copyWith(
            color: textColor,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
