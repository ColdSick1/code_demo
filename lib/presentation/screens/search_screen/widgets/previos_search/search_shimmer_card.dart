import 'package:code_demonstration/presentation/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchShimmerCard extends StatelessWidget {
  const SearchShimmerCard({super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: context.theme.colorScheme.outline,
        highlightColor: context.theme.colorScheme.tertiary,
        child: Container(
          width: double.maxFinite,
          height: 140,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
}
