import 'package:flutter/material.dart';

class FullScreenMessage extends StatelessWidget {
  const FullScreenMessage({
    required this.title,
    required this.message,
    this.buttonText,
    this.buttonIcon,
    this.onButtonPressed,
    super.key,
  });

  final String title;
  final String message;
  final String? buttonText;
  final IconData? buttonIcon;
  final VoidCallback? onButtonPressed;

  bool get hasButtonIcon => buttonIcon != null;
  bool get hasButtonText => buttonText != null;
  bool get showButtonWithIcon => hasButtonIcon && hasButtonText;
  bool get showButton => !hasButtonIcon && hasButtonText;
  bool get showIconButton => hasButtonIcon && !hasButtonText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            message,
            style: theme.textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          if (showButtonWithIcon)
            ElevatedButton.icon(
              icon: Icon(buttonIcon),
              onPressed: onButtonPressed,
              label: Text(buttonText!),
            ),
          if (showButton)
            ElevatedButton(
              onPressed: onButtonPressed,
              child: Text(buttonText!),
            ),
          if (showIconButton)
            IconButton(
              onPressed: onButtonPressed,
              icon: Icon(buttonIcon),
            ),
        ],
      ),
    );
  }
}
