import 'package:flutter/material.dart';
import 'package:sorting/presentation/journeys/selectSorting/web_view_select_sorting.dart';

class SelectSorting extends StatefulWidget {
  const SelectSorting({Key? key}) : super(key: key);

  @override
  _SelectSortingState createState() => _SelectSortingState();
}

class _SelectSortingState extends State<SelectSorting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WebViewSelectSort(),
    );
  }
}
