import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CryptoThumb extends StatelessWidget {
  final double size;
  final String url;

  const CryptoThumb({Key? key, this.size = 30, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size,
      height: size,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: CachedNetworkImage(
        alignment: Alignment.center,
        fit: BoxFit.contain,
        imageUrl: url,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
