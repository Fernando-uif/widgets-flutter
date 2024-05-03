import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          // Para salirse de la pagina
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          // Similar al row pero nos crea todo por renglon si se llena , el SizedBox
          child: Wrap(
            // Agregamos con el spacing un gap entre elementos
            spacing: 10,
            // Podemos alinear de manera vertical WrapCrossAlignment
            // crossAxisAlignment: WrapCrossAlignment.center,

            // Estaremos alineando de manera horizontal WrapAlignment
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {}, child: const Text('Elevated Button')),
              // Si mandamos en el on pressed null lo hara disabled
              const ElevatedButton(
                  onPressed: null, child: Text('Elevated Disabled')),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.access_alarm_rounded),
                  label: const Text('Elevated Icon')),
              FilledButton(onPressed: () {}, child: const Text('Filled')),
              FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.ad_units),
                  label: const Text('FIlledButton')),
              OutlinedButton(
                  onPressed: () {}, child: const Text('OutlinedButton')),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.calendar_month),
                label: const Text('Calendar'),
              ),
              TextButton(onPressed: () {}, child: const Text('textButton')),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.ac_unit_sharp),
                  label: const Text('Text button icon')),
              // Custom Button
              const CustomButtons(),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.app_blocking)),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.accessible_forward),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                  iconColor: const MaterialStatePropertyAll(Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}

class CustomButtons extends StatelessWidget {
  const CustomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        // podemos agregar el evento de tap
        child: InkWell(
          onTap: () {},
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'hello',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
