import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RevenueFilterSheet extends StatelessWidget {
  final Function(String) onSelect;
  const RevenueFilterSheet({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final filters = [
      "Today",
      "Yesterday",
      "This Week",
      "This Month",
      "Custom Date",
    ];

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: filters.map((filter) {
          return ListTile(
            title: Text(filter),
            onTap: () async {
              if (filter == "Custom Date") {
                final pickedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                  initialDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  final formattedDate = DateFormat(
                    'd MMM yyyy',
                  ).format(pickedDate);
                  onSelect(formattedDate);
                }
              } else {
                onSelect(filter);
              }
            },
          );
        }).toList(),
      ),
    );
  }
}
