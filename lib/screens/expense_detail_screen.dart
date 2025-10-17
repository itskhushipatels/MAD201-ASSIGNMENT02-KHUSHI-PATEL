/// Course: MAD204 - Lab 2
/// Student: Khushi Patel - A00198843
/// Date: 2025-10-16
/// Description: Screen to view expense details.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

class ExpenseDetailScreen extends StatelessWidget {
  final Expense expense;

  const ExpenseDetailScreen({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 6),
            Text(expense.title, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Text('Amount', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 6),
            Text(
              '\$${expense.amount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text('Date', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 6),
            Text(
              DateFormat.yMMMMd().format(expense.date),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text('Description', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 6),
            Text(
              expense.description.isEmpty ? '—' : expense.description,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  child: Text('Back', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
