/// Course: MAD204 - Lab 2
/// Student: Khushi Patel - A00198843
/// Date: 2025-10-16
/// Description: Reusable widget to display an expense in a list.

import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;
  final VoidCallback onTap;

  const ExpenseCard({super.key, required this.expense, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        title: Text(
          expense.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(DateFormat.yMMMMd().format(expense.date)),
        trailing: Text('\$${expense.amount.toStringAsFixed(2)}'),
      ),
    );
  }
}
