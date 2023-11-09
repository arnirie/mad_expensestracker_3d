import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mad1_expensestracker_3d/models/expenses_item.dart';

class ExpensesEntry extends StatefulWidget {
  ExpensesEntry({super.key, required this.addItem});

  void Function(ExpensesItem item) addItem;

  @override
  State<ExpensesEntry> createState() => _ExpensesEntryState();
}

class _ExpensesEntryState extends State<ExpensesEntry> {
  TextEditingController descController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  String selectedDate = '';
  var date_format = DateFormat.yMd();

  void selectDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year, 1, 1),
      lastDate: DateTime.now(),
    ); //.then((value) => print(value))
    selectedDate = date_format.format(date!);
    setState(() {});
  }

  // void addItem() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          TextField(
            controller: descController,
            decoration: const InputDecoration(label: Text('Description')),
          ),
          TextField(
            controller: amountController,
            decoration: const InputDecoration(label: Text('Amount')),
            keyboardType: TextInputType.number,
          ),
          const Gap(4),
          Row(
            children: [
              Text(selectedDate != '' ? selectedDate : 'Date'),
              IconButton(
                onPressed: selectDate,
                icon: Icon(Icons.calendar_month),
              ),
            ],
          ),
          const Gap(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    // Navigator.pop(context);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
              const Gap(4),
              ElevatedButton(
                  onPressed: () {
                    widget.addItem(ExpensesItem(
                        description: descController.text,
                        amount: double.parse(amountController.text),
                        date: DateTime.now()));
                  },
                  child: const Text('ADD'))
            ],
          ),
        ],
      ),
    );
  }
}
