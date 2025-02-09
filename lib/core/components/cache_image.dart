import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/custom_circle_pro_ind.dart';

class CacheImage extends StatelessWidget {
  const CacheImage({
    super.key,
    required this.url,
    required this.height,
    required this.width,
  });

  final String url;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      height: height,
      width: width,
      imageUrl: url,
      placeholder: (context, url) => const SizedBox(
        height: 200,
        child: CustomCircleProgIndicator(),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
