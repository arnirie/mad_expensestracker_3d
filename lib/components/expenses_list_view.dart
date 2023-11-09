import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mad1_expensestracker_3d/models/expenses_item.dart';

class ExpensesListView extends StatelessWidget {
  ExpensesListView({super.key, required this.expensesList});

  List<ExpensesItem> expensesList;

  @override
  Widget build(BuildContext context) {
    var date_formatter = DateFormat.yMd();
    var amount_formatter = NumberFormat.currency(symbol: '₱', decimalDigits: 2);
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (context, index) => Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('${expensesList[index].description}'),
              Gap(4),
              Row(
                children: [
                  Text(
                      '${amount_formatter.format(expensesList[index].amount)}'),
                  Spacer(),
                  Text('${date_formatter.format(expensesList[index].date)}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
