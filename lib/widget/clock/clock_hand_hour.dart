import 'package:flutter/material.dart';

class ClockHandHour extends StatelessWidget {
  final double angle;
  final Function(DragStartDetails, Offset) onPanStart;
  final Function(DragEndDetails)? onPanEnd;
  final Function(DragUpdateDetails, Offset) onPanUpdate;
  const ClockHandHour(
      {Key? key,
      required this.angle,
      required this.onPanStart,
      this.onPanEnd,
      required this.onPanUpdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        margin: const EdgeInsets.all(80),
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
                    color: Colors.black,
                    width: 10,
                  ),
                  LayoutBuilder(builder: (context, constraints) {
                    Offset centerOfGestureDetector =
                        Offset(20 / 2, constraints.maxHeight);
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onPanStart: (details) =>
                          onPanStart(details, centerOfGestureDetector),
                      onPanEnd: onPanEnd,
                      onPanUpdate: (details) =>
                          onPanUpdate(details, centerOfGestureDetector),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Colors.black,
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
