import 'package:flutter/material.dart';

class MenuImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final double radius;

  const MenuImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.radius = 0,
  });

  // Gambar Unsplash asli berukuran sangat besar; minta versi yang sudah diperkecil.
  String get _url =>
      url.contains('?') ? url : '$url?auto=format&fit=crop&w=800&q=80';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        _url,
        width: width,
        height: height,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) => progress == null
            ? child
            : SizedBox(
                width: width,
                height: height,
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
        errorBuilder: (context, error, stack) => Container(
          width: width,
          height: height,
          color: Colors.grey.shade300,
          child: const Icon(Icons.broken_image, color: Colors.grey),
        ),
      ),
    );
  }
}
