import 'package:flutter/material.dart';

class ClockHandSecond extends StatelessWidget {
  final double angle;
  final Function(DragStartDetails, Offset) onPanStart;
  final Function(DragEndDetails)? onPanEnd;
  final Function(DragUpdateDetails, Offset) onPanUpdate;
  const ClockHandSecond(
      {Key? key,
      required this.onPanStart,
      this.onPanEnd,
      required this.onPanUpdate,
      required this.angle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        margin: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.centerRight,
        child: Column(
          children: [
            Flexible(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    color: Colors.red,
                    width: 4,
                  ),
                  LayoutBuilder(builder: (context, constraints) {
                    Offset centerOfGestureDetector =
                        Offset(15 / 2, constraints.maxHeight);

                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onPanStart: (details) =>
                          onPanStart(details, centerOfGestureDetector),
                      onPanEnd: onPanEnd,
                      onPanUpdate: (details) =>
                          onPanUpdate(details, centerOfGestureDetector),
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            Flexible(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
