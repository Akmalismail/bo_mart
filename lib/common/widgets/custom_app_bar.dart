import 'package:bo_mart/common/constants/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.titleText,
    super.key,
  });

  final String titleText;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: 40,
            child: BackButton(
              style: IconButton.styleFrom(
                iconSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Text(
              titleText,
              style: theme.textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
      actions: [
        Text(
          'Company Name',
          style: theme.textTheme.labelMedium!.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
        const SizedBox(width: 5),
        Container(
          padding: const EdgeInsets.all(AppPadding.p5),
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
            shape: BoxShape.circle,
          ),
          child: Text(
            'CN',
            style: TextStyle(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }
}
