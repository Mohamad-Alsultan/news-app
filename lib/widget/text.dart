import 'package:flutter/material.dart';
import 'package:news_app/widget/app_dimensions.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.align,
    this.boldText,
    this.color,
    this.height,
    this.size,
    this.style,
  });

  final TextAlign? align;
  final String text;
  final Color? color;
  final double? size;
  final double? height;
  final FontWeight? boldText;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      textAlign: align,
      style: style ??
          TextStyle(
            height: height,
            fontSize: getRes(context, size ?? 16),
            fontWeight: boldText,
            color: color,
          ),
    );
  }
}
