import 'package:flutter/material.dart';

class Est extends StatefulWidget {
  const Est({Key? key}) : super(key: key);

  @override
  State<Est> createState() => _EstState();
}

class _EstState extends State<Est> {
  double _angle = 0.0;
  double _oldAngle = 0.0;
  double _angleDelta = 0.0;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _angle,
      child: Column(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                //   Offset centerOfGestureDetector = Offset(
                // constraints.maxWidth / 2, constraints.maxHeight / 2);
                /**
                     * using center of positioned element instead to better fit the
                     * mental map of the user rotating object.
                     * (height = container height (30) + container height (30) + container height (200)) / 2
                     */
                Offset centerOfGestureDetector =
                    Offset(constraints.maxWidth / 2, 130);
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onPanStart: (details) {
                    final touchPositionFromCenter =
                        details.localPosition - centerOfGestureDetector;
                    _angleDelta = _oldAngle - touchPositionFromCenter.direction;
                  },
                  onPanEnd: (details) {
                    setState(
                      () {
                        _oldAngle = _angle;
                      },
                    );
                  },
                  onPanUpdate: (details) {
                    final touchPositionFromCenter =
                        details.localPosition - centerOfGestureDetector;

                    setState(
                      () {
                        _angle =
                            touchPositionFromCenter.direction + _angleDelta;
                      },
                    );
                  },
                );
              },
            ),
          ),
          Container(
            height: 30,
            width: 5,
            color: Colors.black,
          ),
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
