import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CovidDataCard extends StatelessWidget {
  const CovidDataCard(
      {Key? key,
      required this.color,
      required this.result,
      required this.title})
      : super(key: key);
  final MaterialColor color;
  final String title;
  final String result;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(context.width / 60),
      decoration: BoxDecoration(
        color: color.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: color.shade900,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Row(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: Text(
                  result,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: color.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
