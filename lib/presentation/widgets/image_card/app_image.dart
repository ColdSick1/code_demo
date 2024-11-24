import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const AppImage({
    required this.image,
    this.height,
    this.width,
    this.fit,
    super.key,
  });

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: image,
        height: height,
        width: width,
        fit: fit,
      );
}
