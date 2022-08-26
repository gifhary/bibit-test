import 'package:flutter/material.dart';

class ClockHandMinute extends StatelessWidget {
  const ClockHandMinute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Container(
                  height: 15,
                  width: 15,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
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
    );
  }
}
