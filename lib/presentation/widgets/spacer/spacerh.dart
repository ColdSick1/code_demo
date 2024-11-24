import 'package:flutter/material.dart';

class SpacerH extends StatelessWidget {
  final double width;
  const SpacerH(
    this.width, {
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
      );
}
