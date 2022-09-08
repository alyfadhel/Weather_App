import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final Color? background;
  final Function() onPressed;
  final String text;
  final TextStyle? style;
  const MyButton({
    Key? key,
    this.width,
    this.height,
    this.radius,
    this.background,
    required this.onPressed,
    required this.text,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
            text,
          style: style,
        ),
      ),
    );
  }
}
