import 'package:flutter/material.dart' show IconData, Icons;
// solo importaria lo que nos importa

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;
  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Buttons',
      subTitle: 'Many buttons',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Cards',
      subTitle: 'Container',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Progress Indicator',
      subTitle: 'General and controlls',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'SnackBars & dialogs',
      subTitle: 'Information',
      link: '/snackbar',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Animated container',
      subTitle: 'Stateful widget animated',
      link: '/animated',
      icon: Icons.check_box_outline_blank),
  MenuItem(
      title: 'Ui Controls',
      subTitle: 'Some flutter controls',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
  MenuItem(
      title: 'Introduction to the app',
      subTitle: 'A little tutorial',
      link: '/tutorial',
      icon: Icons.info),
];
