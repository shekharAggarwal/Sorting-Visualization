import 'package:flutter/material.dart';
import 'package:sorting/model/bubble_model.dart';
import 'package:sorting/presentation/widgets/bubble.dart';

class InsertionSortAlgo extends StatefulWidget {
  const InsertionSortAlgo({Key? key}) : super(key: key);

  @override
  _InsertionSortAlgoState createState() => _InsertionSortAlgoState();
}

class _InsertionSortAlgoState extends State<InsertionSortAlgo>
    with SingleTickerProviderStateMixin {
  final BoxDecoration greenDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(25.0),
    color: Colors.green[800],
  );

  final BoxDecoration greenLightDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(25.0),
    color: Colors.green,
  );

  final BoxDecoration redDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(25.0),
    color: Colors.red,
  );

  List<BubbleModel> arr = [
    BubbleModel(
      25,
      BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      const Offset(8.0, 58.0),
    ),
    BubbleModel(
      45,
      BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      const Offset(74.0, 58.0),
    ),
    BubbleModel(
      12,
      BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      const Offset(140.0, 58.0),
    ),
    BubbleModel(
      36,
      BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      const Offset(206.0, 58.0),
    ),
    BubbleModel(
      89,
      BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      const Offset(272.0, 58.0),
    ),
    BubbleModel(
      55,
      BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      const Offset(338.0, 58.0),
    ),
    BubbleModel(
      46,
      BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      const Offset(404.0, 58.0),
    ),
    BubbleModel(
      22,
      BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      const Offset(470.0, 58.0),
    ),
    BubbleModel(
      19,
      BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      const Offset(536.0, 58.0),
    ),
    BubbleModel(
      10,
      BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      const Offset(602.0, 58.0),
    ),
    BubbleModel(
      1,
      BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      const Offset(668.0, 58.0),
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      sort();
    });
  }

  void sort() async {
    int i, j;
    BubbleModel key;
    for (i = 1; i < arr.length; i++) {
      key = arr[i];
      arr[i].decoration = redDecoration;
      j = i - 1;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 500));
      while (j >= 0 && arr[j].n > key.n) {
        arr[j + 1] = arr[j];
        j = j - 1;
      }
      arr[j + 1] = key;
      arr[j + 1].decoration = greenLightDecoration;
      setState(() {});
      await Future.delayed(const Duration(microseconds: 500));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Wrap(
            children: arr
                .map(
                  (e) => Bubble(
                    decoration: e.decoration,
                    n: e.n,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
