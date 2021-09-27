import 'package:flutter/cupertino.dart';

class BubbleModel {
  int n;
  BoxDecoration? decoration;
  List<Offset> offset;
  int? i;
  BubbleModel(this.n, this.offset, {this.decoration, this.i});
}
