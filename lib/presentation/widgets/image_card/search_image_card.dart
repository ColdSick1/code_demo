import 'package:code_demonstration/presentation/core/extensions/build_context_ext.dart';
import 'package:code_demonstration/presentation/widgets/image_card/app_image.dart';
import 'package:flutter/material.dart';

class SmallImageCard extends StatelessWidget {
  final String image;
  const SmallImageCard({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: context.theme.colorScheme.surface,
        ),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.192,
          child: AspectRatio(
            aspectRatio: 72 / 86,
            child: AppImage(
              image: image,
              width: 35,
              height: 65,
            ),
          ),
        ),
      );
}
