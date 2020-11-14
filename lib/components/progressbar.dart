import 'dart:ui';

import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double width;
  final double height;
  final double percentage;
  final BorderRadius borderRadius;
  final int hoursSpent;

  static const BorderRadius defaultRadius = BorderRadius.only(
      bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5));

  ProgressBar(
      {Key key,
      @required this.width,
      @required this.percentage,
      @required this.height,
      @required this.hoursSpent,
      this.borderRadius: defaultRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double percWidth = this.percentage > 100
        ? this.width
        : (this.width) * (this.percentage / 100);
    return Stack(
      children: [
        // Bottom bar
        Container(
          width: this.width,
          height: this.height,
          decoration: BoxDecoration(
              color: Colors.lightGreen, borderRadius: this.borderRadius),
        ),
        Container(
          width: percWidth,
          height: this.height,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: this.borderRadius),
        ),
        this._progressBarContainer()
      ],
    );
  }

  Container _progressBarContainer() {
    Row child;
    if (this.percentage >= 100) {
      child = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: this._progressBarText(),
      );
    } else {
      child = Row(
        children: this._progressBarText(),
      );
    }
    return Container(width: this.width, child: child);
  }

  List<Widget> _progressBarText() {
    if (this.percentage >= 100) {
      return [
        Text(this.hoursSpent.toString() + " total hours"),
      ];
    } else if (this.percentage >= 50) {
      return [
        SizedBox(
            width: (this.width * (this.percentage / 100) -
                (window.devicePixelRatio * 20))),
        Text(this.percentage.toStringAsFixed(1) + "%")
      ];
    } else {
      return [
        SizedBox(
            width: (this.width * (this.percentage / 100) +
                (window.devicePixelRatio * 2))),
        Text(this.percentage.toStringAsFixed(1) + "%")
      ];
    }
  }
}
