import 'package:flutter/material.dart';

class Bubble extends StatefulWidget {
  const Bubble({Key? key, required this.decoration, required this.n})
      : super(key: key);
  final BoxDecoration decoration;
  final int n;

  @override
  State<Bubble> createState() => _BubbleState();
}

class _BubbleState extends State<Bubble> {
  GlobalKey pos = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      getPositions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        key: pos,
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(10),
        decoration: widget.decoration,
        child: Center(
          child: Text(
            "${widget.n}",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  getPositions() {
    final RenderBox? renderBoxRed =
        pos.currentContext!.findRenderObject() as RenderBox;
    final positionRed = renderBoxRed!.localToGlobal(Offset.zero);
    print("POSITION of Red: ${positionRed} ");
  }
}
