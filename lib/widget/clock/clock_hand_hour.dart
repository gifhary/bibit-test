import 'package:flutter/material.dart';

class ClockHandHour extends StatelessWidget {
  const ClockHandHour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  color: Colors.black,
                  width: 10,
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
