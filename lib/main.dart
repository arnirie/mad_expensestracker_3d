import 'package:flutter/material.dart';
import 'package:mad1_expensestracker_3d/screens/expenses_list.dart';

void main() {
  runApp(const ExpensesTrackerApp());
}

class ExpensesTrackerApp extends StatelessWidget {
  const ExpensesTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Color(0xFF363062),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        // scaffoldBackgroundColor: Colors.red,
        appBarTheme: AppBarTheme(
          elevation: 4,
          color: colorScheme.onPrimaryContainer,
          foregroundColor: colorScheme.onPrimary,
        ),
        cardTheme: CardTheme(
          color: colorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w300,
          ),
          displayLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.onPrimaryContainer,
            foregroundColor: colorScheme.onPrimary,
          ),
        ),
      ),
      home: ExpensesListScreen(),
    );
  }
}
