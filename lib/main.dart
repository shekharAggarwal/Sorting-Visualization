import 'package:flutter/material.dart';
import 'package:sorting/presentation/journeys/selectSorting/select_sorting.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Sorting',
      home: SelectSorting(),
      // theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    ),
  );
}
