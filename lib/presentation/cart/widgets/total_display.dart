import 'package:bo_mart/common/constants/styles.dart';
import 'package:bo_mart/presentation/cart/widgets/custom_vertical_divider.dart';
import 'package:flutter/material.dart';

class TotalDisplay extends StatelessWidget {
  const TotalDisplay({
    required this.label,
    required this.value,
    this.borderColor,
    this.arrowIcon = false,
    super.key,
  });

  final String label;
  final String value;
  final Color? borderColor;
  final bool arrowIcon;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (borderColor != null)
            CustomVerticalDivider(
              width: 3,
              color: borderColor!,
            ),
          Container(
            padding: const EdgeInsets.only(
              left: AppPadding.p5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: Colors.grey,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: value),
                      if (arrowIcon) ...[
                        const TextSpan(text: ' '),
                        const WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: kDefaultFontSize,
                          ),
                        ),
                      ],
                    ],
                  ),
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
