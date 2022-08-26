import 'package:flutter/material.dart';

class ClockHandMinute extends StatelessWidget {
  final double angle;
  final Function(DragStartDetails, Offset) onPanStart;
  final Function(DragEndDetails)? onPanEnd;
  final Function(DragUpdateDetails, Offset) onPanUpdate;
  const ClockHandMinute(
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
        margin: const EdgeInsets.all(50),
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.centerRight,
        child: Column(
          children: [
            Flexible(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
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
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  }),
                  Container(
                    color: Colors.black,
                    width: 7,
                  ),
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
