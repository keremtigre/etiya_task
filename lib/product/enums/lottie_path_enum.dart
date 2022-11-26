import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum LottiePathEnum { loading, error }

mixin LottiePathEnumExtension {
  Widget toWidget(String name) {
    return Lottie.asset(_pathValue(name));
  }

  String _pathValue(String path) => 'assets/json/$path.json';
}
