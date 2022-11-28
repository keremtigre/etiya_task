import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

IconButton reloadButton(BuildContext context, VoidCallback func) {
  return IconButton(
    padding: EdgeInsets.only(right: context.width / 20),
    onPressed:func,
    icon: Icon(Icons.replay_rounded),
    iconSize: 30,
  );
}
