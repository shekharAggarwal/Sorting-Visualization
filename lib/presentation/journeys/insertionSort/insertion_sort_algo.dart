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
      sort();
    });
  }

  void sort() async {
    int i, j;
    BubbleModel key;
    for (i = 1; i < arr.length; i++) {
      key = arr[i];
      view[arr[i].i!].decoration = redDecoration;
      j = i - 1;
      if (mounted) setState(() {});
      await Future.delayed(const Duration(milliseconds: 300));
      while (j >= 0 && arr[j].n > key.n) {
        Offset tempOffset = arr[j].offset.last;
        arr[j].offset.add(key.offset.last);
        arr[j + 1] = arr[j];
        key.offset.add(tempOffset);
        j = j - 1;
      }
      arr[j + 1] = key;
      view[arr[j + 1].i!].decoration = greenLightDecoration;
      arr.map((e) {
        view[e.i!].offset = e.offset;
      }).toList();
      if (mounted) setState(() {});
      await Future.delayed(const Duration(milliseconds: 750));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: view
            .map(
              (e) => AnimatedPositioned(
                duration: const Duration(milliseconds: 700),
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
