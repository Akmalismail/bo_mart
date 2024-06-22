import 'package:bo_mart/common/constants/styles.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.icon,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p5),
        child: Icon(
          icon,
          size: theme.textTheme.bodyMedium!.fontSize!,
        ),
      ),
    );
  }
}
