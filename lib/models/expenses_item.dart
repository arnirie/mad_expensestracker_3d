class ExpensesItem {
  ExpensesItem({
    // this.id = DateTime.now(),
    // required this.id,
    required this.description,
    required this.amount,
    required this.date,
  });

  final String id = DateTime.now().toString();
  final String description;
  final double amount;
  final DateTime date;
}
