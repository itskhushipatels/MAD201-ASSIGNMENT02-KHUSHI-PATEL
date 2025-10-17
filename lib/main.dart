/// Course: MAD204 - Lab 2
/// Student: Khushi Patel - A00198843
/// Date: 2025-10-16
/// Description: Main entry point for Personal Expense Tracker app.

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense Tracker',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
