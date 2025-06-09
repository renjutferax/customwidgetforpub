library;

import 'package:flutter/material.dart';

class MultiSelectDialog<T> extends StatefulWidget {
  final List<T> items;
  final List<T> initiallySelected;
  final String Function(T) itemLabel;
  final Function(List<T>) onSelected;

  const MultiSelectDialog({
    super.key,
    required this.items,
    required this.initiallySelected,
    required this.itemLabel,
    required this.onSelected,
  });

  @override
  State<MultiSelectDialog<T>> createState() => _MultiSelectDialogState<T>();
}

class _MultiSelectDialogState<T> extends State<MultiSelectDialog<T>> {
  late List<T> _tempSelected;

  @override
  void initState() {
    super.initState();
    _tempSelected = List<T>.from(widget.initiallySelected);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Select Items"),
      content: SingleChildScrollView(
        child: Column(
          children: widget.items.map((item) {
            final label = widget.itemLabel(item);
            final isSelected = _tempSelected.contains(item);
            return CheckboxListTile(
              value: isSelected,
              title: Text(label),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? selected) {
                setState(() {
                  if (selected == true) {
                    _tempSelected.add(item);
                  } else {
                    _tempSelected.remove(item);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSelected(_tempSelected);
            Navigator.of(context).pop();
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
