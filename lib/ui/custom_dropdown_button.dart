import 'package:flutter/material.dart';

import 'package:project/extensions/context_extensions.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  final String hintText;
  final List<DropdownMenuItem<T>> selectedItems;
  final List<DropdownMenuItem<T>> items;
  final T? selected;

  final void Function(T?) onChanged;

  const CustomDropdownButton({
    super.key,
    required this.hintText,
    required this.selectedItems,
    required this.items,
    this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.colorScheme.primary),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: selected,
          selectedItemBuilder: (context) => selectedItems,
          items: items,
          hint: Center(child: Text(hintText)),
          borderRadius: BorderRadius.circular(16),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
