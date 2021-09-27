import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  const Bubble({Key? key, required this.decoration, required this.n})
      : super(key: key);
  final BoxDecoration decoration;
  final int n;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(10),
        decoration: decoration,
        child: Center(
          child: Text(
            "$n",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
