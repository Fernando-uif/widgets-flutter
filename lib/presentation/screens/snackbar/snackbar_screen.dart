import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackBarScreen({super.key});
  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Hello world'),
      // Cada accion hara que se cierre nuestro snackbar
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
    ));
  }

  void openDialog(BuildContext context) {
    showDialog(
      // no podra cerrarlo , si no que solo se podra con el pop
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text(
            'Ea est sunt velit ullamco proident do. Pariatur eu id eu laboris fugiat ea exercitation occaecat voluptate nostrud ut elit anim culpa. Voluptate culpa dolore proident fugiat aute labore consectetur enim ipsum nisi elit veniam. Tempor anim nulla aute cillum non cillum duis dolore ullamco. Minim est aute consectetur ex ullamco occaecat aute amet pariatur.'),
        actions: [
          TextButton(
              // Gracias al context podemos acceder a este elemento de pop para cerrar la venta
              onPressed: () => context.pop(),
              child: const Text('Cancel')),
          FilledButton(
              onPressed: () => context.pop(), child: const Text("Accept"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar and dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Lorem ipsum Laborum nisi exercitation ad adipisicing. Tempor et ad enim fugiat. Et adipisicing et tempor ea. Pariatur dolor ullamco qui pariatur proident et ut. Nisi ut excepteur ex dolore esse occaecat ullamco veniam velit esse consectetur non ullamco.')
                ]);
              },
              child: const Text('Used licenses'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Show dialog'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show snackbar'),
        onPressed: () => showCustomSnackbar(context),
        icon: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
