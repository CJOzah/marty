import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;

  const HorizontalLine({
    Key? key,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}
