import 'package:flutter/material.dart';

class PositionedCard extends StatelessWidget {
  double? top, bottom, left, right;
  Widget child;
  Color color;
  PositionedCard(
      {this.top,
      this.bottom,
      this.left,
      this.right,
      required this.child,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            0,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 5,
          ),
          width: 65,
          child: child,
        ),
      ),
    );
  }
}
