import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  static const name = 'ui_control_screen';
  const UiControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();
  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            value: isDeveloper,
            title: const Text('Developer mode'),
            subtitle: const Text('Aditional control'),
            onChanged: (value) => setState(() {
                  isDeveloper = !isDeveloper;
                })),
        ExpansionTile(
          title: const Text('Transport vehicle'),
          subtitle: Text(
              selectedTransportation.toString().split('.')[1].toUpperCase()),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Travel by car'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) {
                return setState(() {
                  selectedTransportation = Transportation.car;
                });
              },
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Travel by boat'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) {
                return setState(() {
                  selectedTransportation = Transportation.boat;
                });
              },
            ),
            RadioListTile(
              title: const Text('By plane'),
              subtitle: const Text('Travel by plane'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) {
                return setState(() {
                  selectedTransportation = Transportation.plane;
                });
              },
            ),
            RadioListTile(
              title: const Text('By submarine'),
              subtitle: const Text('Travel by submarine'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) {
                return setState(() {
                  selectedTransportation = Transportation.submarine;
                });
              },
            )
          ],
        ),
        CheckboxListTile(
          title: const Text('Do you want breakfast'),
          value: wantsBreakfast,
          onChanged: (value) {
            return setState(() {
              wantsBreakfast = !wantsBreakfast;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Do you want lunch'),
          value: wantsLunch,
          onChanged: (value) {
            return setState(() {
              wantsLunch = !wantsLunch;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Do you want dinner'),
          value: wantsDinner,
          onChanged: (value) {
            return setState(() {
              wantsDinner = !wantsDinner;
            });
          },
        ),
      ],
    );
  }
}
