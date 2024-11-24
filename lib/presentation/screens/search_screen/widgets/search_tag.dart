import 'package:code_demonstration/presentation/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

class SearchTag extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const SearchTag({
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.theme.colorScheme.outline,
          ),
          child: Text(
            title,
            style: context.theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
}
