import 'package:flutter/material.dart';
import 'package:sorting/model/bubbleModel.dart';
import 'package:sorting/presentation/widgets/bubble.dart';

class InsertionSortAlgo extends StatefulWidget {
  const InsertionSortAlgo({Key? key}) : super(key: key);

  @override
  _InsertionSortAlgoState createState() => _InsertionSortAlgoState();
}

class _InsertionSortAlgoState extends State<InsertionSortAlgo>
    with SingleTickerProviderStateMixin {

  List<int> arr = [25, 45, 12, 36, 89, 55, 46, 22, 19, 10, 1];

  List<BubbleModel> ls = List<BubbleModel>.empty(growable: true);

  final BoxDecoration greenDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(25.0),
    color: Colors.green,
  );

  final BoxDecoration redDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(25.0),
    color: Colors.red,
  );

  @override
  void initState() {
    super.initState();
    arr.map((e) {
      ls.add(BubbleModel(
          widget: Bubble(
            decoration: greenDecoration,
            n: e,
          ),
          offset: Offset.zero));
    }).toList();
    /* WidgetsBinding.instance!.addPostFrameCallback((_) {
      sort();
    });*/
  }

  void sort() async {
    int i, key, j;
    for (i = 1; i < arr.length; i++) {
      key = arr[i];
      j = i - 1;
      while (j >= 0 && arr[j] > key) {
        arr[j + 1] = arr[j];
        j = j - 1;
      }
      arr[j + 1] = key;
      setState(() {});
      await Future.delayed(Duration(microseconds: 500));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Wrap(
            children: ls
                .map(
                  (e) => e.widget,
            )
                .toList(),
          )
        ],
      ),
    );
  }
}