import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  static const name = 'counter_screen';

  Counter({super.key});

  final int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: const Center(
        child: Text(
          'Valor: 10',
          style:  TextStyle(fontSize: 22),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), onPressed: () => {}),
    );
  }
}
