import 'package:flutter/material.dart';
import 'package:sorting/model/bubble_model.dart';
import 'package:sorting/presentation/widgets/bubble.dart';

class BubbleSort extends StatefulWidget {
  const BubbleSort({Key? key}) : super(key: key);

  @override
  _BubbleSortState createState() => _BubbleSortState();
}

class _BubbleSortState extends State<BubbleSort>
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
      [const Offset(8.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      i: 0,
    ),
    BubbleModel(
      45,
      [const Offset(74.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      i: 1,
    ),
    BubbleModel(
      12,
      [const Offset(140.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      i: 2,
    ),
    BubbleModel(
      36,
      [const Offset(206.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      i: 3,
    ),
    BubbleModel(
      89,
      [const Offset(272.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      i: 4,
    ),
    BubbleModel(
      55,
      [const Offset(338.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      i: 5,
    ),
    BubbleModel(
      46,
      [const Offset(404.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      i: 6,
    ),
    BubbleModel(
      22,
      [const Offset(470.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      i: 7,
    ),
    BubbleModel(
      19,
      [const Offset(536.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      i: 8,
    ),
    BubbleModel(
      10,
      [const Offset(602.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      i: 9,
    ),
    BubbleModel(
      1,
      [const Offset(668.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      i: 10,
    ),
  ];

  List<BubbleModel> view = [
    BubbleModel(25, [const Offset(8.0, 58.0)],
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.green,
        )),
    BubbleModel(
      45,
      [const Offset(74.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
    ),
    BubbleModel(
      12,
      [const Offset(140.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
    ),
    BubbleModel(
      36,
      [const Offset(206.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
    ),
    BubbleModel(
      89,
      [const Offset(272.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
    ),
    BubbleModel(
      55,
      [const Offset(338.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
    ),
    BubbleModel(
      46,
      [const Offset(404.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
    ),
    BubbleModel(
      22,
      [const Offset(470.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
    ),
    BubbleModel(
      19,
      [const Offset(536.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
    ),
    BubbleModel(
      10,
      [const Offset(602.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
    ),
    BubbleModel(
      1,
      [const Offset(668.0, 58.0)],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      bubbleSort();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void bubbleSort() async {
    int n = arr.length;
    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - i - 1; j++) {
        view[arr[j].i!].decoration = redDecoration;
        view[arr[j + 1].i!].decoration = redDecoration;
        if (mounted) setState(() {});
        await Future.delayed(const Duration(milliseconds: 300));
        if (arr[j].n > arr[j + 1].n) {
          Offset tempOffset = arr[j + 1].offset.last;
          BubbleModel temp = arr[j];
          arr[j + 1].offset.add(arr[j].offset.last);
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
          arr[j + 1].offset.add(tempOffset);
          arr.map((e) {
            view[e.i!].offset = e.offset;
          }).toList();
          if (mounted) setState(() {});
          await Future.delayed(const Duration(milliseconds: 650));
        }
        view[arr[j].i!].decoration = greenLightDecoration;
        n - i - 1 == j + 1
            ? view[arr[j + 1].i!].decoration = greenDecoration
            : view[arr[j + 1].i!].decoration = greenLightDecoration;
        if (mounted) setState(() {});
        await Future.delayed(const Duration(milliseconds: 300));
      }
    }
    view[arr[0].i!].decoration = greenDecoration;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: view
            .map(
              (e) => AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                top: e.offset.last.dy,
                left: e.offset.last.dx,
                child: Bubble(
                  key: ValueKey(e.n.toString()),
                  decoration: e.decoration!,
                  n: e.n,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
