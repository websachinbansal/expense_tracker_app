import 'package:flutter/material.dart';
import 'package:flutter_expense_trackerapp/widgets/expenses_lists/expense_item.dart';
// import 'package:flutter_expense_trackerapp/expenses.dart';

import '../../model/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final void Function(Expense expense) onRemoveExpense;

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            child: ExpenseItems(expenses[index])));
  }
}
