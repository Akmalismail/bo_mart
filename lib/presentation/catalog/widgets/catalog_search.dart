import 'package:bo_mart/common/utils.dart/extensions.dart';
import 'package:flutter/material.dart';

class CatalogSearch extends StatelessWidget {
  const CatalogSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.borderColor,
          ),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: theme.borderColor,
        ),
        contentPadding: EdgeInsets.zero,
        constraints: const BoxConstraints(
          maxHeight: 40,
        ),
        hintText: 'Search',
        hintStyle: theme.textTheme.bodyLarge!.copyWith(
          color: theme.hintColor,
        ),
      ),
    );
  }
}
