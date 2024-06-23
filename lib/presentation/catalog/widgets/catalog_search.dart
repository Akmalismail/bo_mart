import 'package:bo_mart/common/utils/extensions.dart';
import 'package:flutter/material.dart';

class CatalogSearch extends StatelessWidget {
  const CatalogSearch({
    required this.controller,
    this.onChanged,
    super.key,
  });

  final TextEditingController controller;
  final Function(String? text)? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: controller,
      onChanged: onChanged,
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
