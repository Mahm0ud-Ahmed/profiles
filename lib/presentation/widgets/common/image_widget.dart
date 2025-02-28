import 'package:flutter/material.dart';

import '../../../config/assets/assets.gen.dart';

class ImageWidget extends StatelessWidget {
  final dynamic image;
  final BoxFit fit;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Decoration? decoration;
  final Color? svgColor;
  final Widget Function(BuildContext context, Widget image)? imageBuilder;

  const ImageWidget({
    super.key,
    required this.image,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.decoration,
    this.svgColor,
    this.imageBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      margin: margin,
      decoration: decoration,
      child: imageBuilder != null ? imageBuilder!.call(context, buildImage(context)) : buildImage(context),
    );
  }

  Widget buildImage(BuildContext context) {
    switch (image.runtimeType) {
      case const (String):
        return _buildImageNetwork(image);
      case const (SvgGenImage):
        return _buildImageSvg(image);
      default:
        return const SizedBox.shrink();
    }
  }

  dynamic _buildImageNetwork(String? url) {
    return Image.network(
      url ?? '',
      fit: fit,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) {
        // Fallback for when image doesn't load
        return Icon(
          Icons.person,
          size: 24,
          color: Colors.grey[600],
        );
      },
    );
  }

  dynamic _buildImageSvg(SvgGenImage asset) {
    return asset.svg(
      fit: fit,
      width: width,
      height: height,
      colorFilter: svgColor != null ? ColorFilter.mode(svgColor!, BlendMode.srcIn) : null,
    );
  }
}
