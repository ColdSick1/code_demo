import 'package:flutter/material.dart';

class SpacerV extends StatelessWidget {
  final double height;
  const SpacerV(
    this.height, {
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
      );
}
