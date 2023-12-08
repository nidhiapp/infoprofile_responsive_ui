import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CircularNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  CircularNetworkImage({
    required this.imageUrl,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
