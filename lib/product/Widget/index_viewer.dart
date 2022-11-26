import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class IndexViewerContainer extends StatelessWidget {
  int index;
  int currentIndex;
  IndexViewerContainer(
      {super.key, required this.index, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: index == currentIndex ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
