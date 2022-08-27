import 'package:flutter/material.dart';

class ClockBody extends StatelessWidget {
  const ClockBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //technically image asset is not a plugin/package/library
    //i can make it with custom painter, but it will take more time
    return Image.asset('assets/clock.png');
  }
}
