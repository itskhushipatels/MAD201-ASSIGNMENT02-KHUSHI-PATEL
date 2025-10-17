/// Course: MAD204 - Lab 2
/// Student: Khushi Patel - A00198843
/// Date: 2025-10-16
/// Description: Expense model for Personal Expense Tracker.

class Expense {
  /// Title/short description of the expense.
  final String title;

  /// Amount spent in CAD.
  final double amount;

  /// Detailed notes about the expense.
  final String description;

  /// Date of the expense.
  final DateTime date;

  Expense({
    required this.title,
    required this.amount,
    required this.description,
    required this.date,
  });
}
