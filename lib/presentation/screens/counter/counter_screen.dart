import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class Counter extends ConsumerWidget {
  static const name = 'counter_screen';

  Counter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int tapCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(isDarkModeProvider.notifier).update((prev) => !prev);
              },
              icon: isDarkMode
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined)),
        ],
      ),
      body: Center(
        child: Text(
          'Valor: $tapCounter',
          style: const TextStyle(fontSize: 22),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // ref.read(counterProvider.notifier).state += 1;
            ref.read(counterProvider.notifier).update((state) => state + 1);
          }),
    );
  }
}
