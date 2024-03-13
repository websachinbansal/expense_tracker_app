import 'package:flutter/material.dart';
import 'package:flutter_expense_trackerapp/widgets/chart/chart.dart';
// import 'package:flutter/widgets.dart';

import 'expenses_lists/expense_list.dart';
import '../model/expense.dart';
import 'expenses_lists/new_expense.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _registerExpense = [
    Expense(
        title: 'flutter course',
        amount: 19.3,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 15,
        date: DateTime.now(),
        category: Category.lesure)
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            ));
  }

  void _addExpense(Expense expense) {
    setState(
      () {
        _registerExpense.add(expense);
      },
    );
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registerExpense.indexOf(expense);
    setState(
      () {
        _registerExpense.remove(expense);
      },
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      content: Text('Expense deleted'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registerExpense.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expense found, Start adding some'),
    );

    if (_registerExpense.isNotEmpty) {
      mainContent = ExpenseList(
          expenses: _registerExpense, onRemoveExpense: _removeExpense);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense tracker '),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children:
            //toolbar with the add button
            [Chart(expenses: _registerExpense), Expanded(child: mainContent)],
      ),
    );
  }
}
