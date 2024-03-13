import 'package:flutter/material.dart';
import 'package:flutter_expense_trackerapp/widgets/expenses.dart'; // Make sure this path is correct

void main() {
  runApp(ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Expenses(),
    );
  }
}
