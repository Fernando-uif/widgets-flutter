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
];
