import 'package:flutter/material.dart';
import 'package:sorting/common/constants/strings.dart';

class WebViewSelectSort extends StatelessWidget {
  WebViewSelectSort({Key? key, required this.onTap}) : super(key: key);
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: Strings.SortingName.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => onTap(index),
            child: Card(
              child: Center(
                child: Text(Strings.SortingName[index]),
              ),
            ),
          ),
        );
      },
    );
  }
}
