/// Course: MAD204 - Lab 2
/// Student: <Your Full Name> - <Student ID>
/// Date: 2025-10-16
/// Description: Home screen showing the list of expenses.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';
import '../screens/add_expense_screen.dart';
import '../screens/expense_detail_screen.dart';
import '../widgets/expense_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Expense> _expenses = [];

  double get _totalExpenses => _expenses.fold(0.0, (p, e) => p + e.amount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Expense Tracker')),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Expenses',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '\$${_totalExpenses.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Text(DateFormat.yMMMMd().format(DateTime.now())),
                ],
              ),
            ),
          ),
          Expanded(
            child: _expenses.isEmpty
                ? const Center(
                    child: Text('No expenses yet. Tap + to add one.'),
                  )
                : ListView.builder(
                    itemCount: _expenses.length,
                    itemBuilder: (context, index) {
                      final exp = _expenses[index];
                      return ExpenseCard(
                        expense: exp,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ExpenseDetailScreen(expense: exp),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddExpenseScreen()),
          );
          if (result != null && result is Expense) {
            setState(() {
              _expenses.add(result);
              _expenses.sort((a, b) => b.date.compareTo(a.date));
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
