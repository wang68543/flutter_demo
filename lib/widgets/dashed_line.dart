import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;

  const DashedLine(
      {super.key,
      this.axis = Axis.horizontal,
      this.dashedWidth = 1,
      this.dashedHeight = 1,
      this.count = 10,
      this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (_) {
        return SizedBox(
          height: dashedHeight,
          width: dashedWidth,
          child: DecoratedBox(decoration: BoxDecoration(color: color)),
        );
      }),
    );
  }
}
