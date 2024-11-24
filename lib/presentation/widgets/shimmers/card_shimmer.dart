import 'package:code_demonstration/presentation/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  final double height;
  const ShimmerCard({required this.height, super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: context.theme.colorScheme.surface,
        highlightColor: context.theme.colorScheme.inverseSurface,
        child: Container(
          height: height,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.red,
          ),
        ),
      );
}
