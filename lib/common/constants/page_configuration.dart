import 'package:flutter/material.dart';

class InformationParser extends RouteInformationParser<Uri> {
  @override
  Future<Uri> parseRouteInformation(RouteInformation routeInformation) async =>
      Uri.parse(routeInformation.location!);

  @override
  RouteInformation? restoreRouteInformation(Uri configuration) =>
      RouteInformation(location: Uri.decodeComponent(configuration.toString()));
}

class PageRoutePath {
  final String? id;
  final bool isUnknown;

  PageRoutePath.home()
      : id = null,
        isUnknown = false;

  PageRoutePath.details(this.id) : isUnknown = false;

  PageRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null;

  bool get isInsertionSort => id == 'InsertionSort';

  bool get isQuickSort => id == 'QuickSort';

  bool get isBubbleSort => id == 'BubbleSort';

  bool get isMergeSort => id == 'MergeSort';

  bool get isSelectionSort => id == 'SelectionSort';

  bool get isHeapSort => id == 'HeapSort';

  bool get isRadixSort => id == 'RadixSort';

  bool get isBucketSort => id == 'BucketSort';
}
