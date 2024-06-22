import 'package:bo_mart/common/constants/styles.dart';
import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({
    this.width,
    this.height,
    this.radius,
    this.color,
    super.key,
  });

  final double? width;
  final double? height;
  final double? radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final DividerThemeData dividerTheme = DividerTheme.of(context);
    final double width = this.width ?? dividerTheme.space ?? 16;

    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? AppRadius.r4),
        border: Border(
          left: Divider.createBorderSide(
            context,
            width: width,
            color: color,
          ),
        ),
      ),
    );
  }
}
