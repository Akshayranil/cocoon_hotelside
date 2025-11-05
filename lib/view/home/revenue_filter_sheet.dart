import 'package:flutter/material.dart';

class RevenueFilterSheet extends StatelessWidget {
  final Function(String) onSelect;
  const RevenueFilterSheet({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final filters = ["Today", "Yesterday", "This Week", "This Month"];

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: filters.map((filter) {
          return ListTile(
            title: Text(filter),
            onTap: () => onSelect(filter),
          );
        }).toList(),
      ),
    );
  }
}
