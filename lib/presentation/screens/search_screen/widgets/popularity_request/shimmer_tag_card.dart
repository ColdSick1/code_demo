import 'package:code_demonstration/presentation/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTagCard extends StatelessWidget {
  final double? width;
  const ShimmerTagCard({this.width = 70, super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: context.theme.colorScheme.outline,
        highlightColor: context.theme.colorScheme.tertiary,
        child: Container(
          width: width,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
}
