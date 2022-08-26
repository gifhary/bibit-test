import 'package:bibit_clock/widget/clock/clock.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clock Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: const [
            Clock(),
          ],
        ),
      ),
    );
  }
}
