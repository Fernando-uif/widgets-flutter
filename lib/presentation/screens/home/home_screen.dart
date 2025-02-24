import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/cards/card_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          final menuItems = appMenuItems[index];
          // return Text(appMenuItems[index].title);
          return _CustomListTile(menuItems: menuItems);
        },
        itemCount: appMenuItems.length);
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItems,
  });

  final MenuItem menuItems;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItems.icon, color: colors.primary),
      title: Text(menuItems.title),
      trailing: Icon(
        Icons.arrow_outward_rounded,
        color: colors.primary,
      ),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // );
        // Navigator.pushNamed(context, menuItems.link);

        // Con go iriamos a 1 pantalla pero si queremos un stack tenemos que colocar el push
        context.push(menuItems.link);
        // context.pushNamed(CardScreen.name);
      },
      subtitle: Text(menuItems.subTitle),
    );
  }
}
