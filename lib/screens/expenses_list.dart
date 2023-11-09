import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mad1_expensestracker_3d/components/expenses_entry.dart';
import 'package:mad1_expensestracker_3d/components/expenses_list_view.dart';
import 'package:mad1_expensestracker_3d/models/expenses_item.dart';

class ExpensesListScreen extends StatefulWidget {
  ExpensesListScreen({super.key});

  @override
  State<ExpensesListScreen> createState() => _ExpensesListScreenState();
}

class _ExpensesListScreenState extends State<ExpensesListScreen> {
  List<ExpensesItem> _expensesList = [
    ExpensesItem(
        description: 'rental', amount: 5000, date: DateTime(2023, 10, 5)),
    ExpensesItem(
        description: 'electricity', amount: 2500, date: DateTime(2023, 11, 2)),
    ExpensesItem(
        description: 'travel', amount: 500, date: DateTime(2023, 11, 6)),
  ];

  void addExpensesItem(ExpensesItem item) {
    _expensesList.add(item);
    setState(() {});
  }

  void showExpensesEntry() {
    showModalBottomSheet(
      context: context,
      builder: (_) => ExpensesEntry(
        addItem: addExpensesItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expenses'),
        actions: [
          IconButton(
            onPressed: showExpensesEntry,
            icon: Icon(Icons.add),
          ),
        ],
        // backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
              child: ExpensesListView(
            expensesList: _expensesList,
          )),
        ],
      ),
    );
  }
}
