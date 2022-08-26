import 'package:flutter/material.dart';

class ClockHandSecond extends StatelessWidget {
  const ClockHandSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  height: 15,
                  width: 15,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  color: Colors.red,
                  width: 4,
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
