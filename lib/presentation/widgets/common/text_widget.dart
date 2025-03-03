import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final TextStyle? style;
  final String text;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? lines;
  final EdgeInsetsGeometry? padding;
  const TextWidget({
    super.key,
    required this.text,
    this.style,
    this.overflow,
    this.textAlign,
    this.lines,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        text,
        style: style ?? Theme.of(context).textTheme.labelMedium,
        softWrap: true,
        overflow: overflow,
        textAlign: textAlign,
        maxLines: lines,
      ),
    );
  }
}
