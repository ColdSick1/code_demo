import 'package:code_demonstration/domain/entity/search_product.dart';
import 'package:code_demonstration/presentation/widgets/image_card/search_image_card.dart';
import 'package:code_demonstration/presentation/widgets/spacer/spacerh.dart';
import 'package:flutter/material.dart';

class SearchProductCard extends StatelessWidget {
  final SearchProduct model;
  final VoidCallback onTap;
  const SearchProductCard({
    required this.model,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              SmallImageCard(image: model.image),
              const SpacerH(16),
              Expanded(child: Text(model.name)),
              const SpacerH(16),
            ],
          ),
        ),
      );
}
