import 'package:flutter/material.dart';
import 'package:sorting/common/constants/strings.dart';
import 'package:sorting/presentation/journeys/insertionSort/insertion_sort_algo.dart';

class WebViewSelectSort extends StatelessWidget {
  const WebViewSelectSort({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      children: Strings.SortingName.map((name) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => InsertionSortAlgo()));
              },
              child: Card(
                child: Center(
                  child: Text(name),
                ),
              ),
            ),
          )).toList(),
    );
  }
}
