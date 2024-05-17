import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;
  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Search the food',
      'Lorem voluptate aliqua proident id ea sint duis minim nisi ullamco.',
      'assets/images/1.png'),
  SlideInfo(
      'fast food',
      'Qui aliqua quis sit duis qui dolore voluptate irure cillum et aliqua ea.',
      'assets/images/2.png'),
  SlideInfo(
      'Enjoy the food',
      'Dolor duis tempor excepteur nisi nostrud mollit.',
      'assets/images/3.png'),
];

// si queremos tener los que esta pasando en nuestro slide tenemos que convertir esto en un statefulWidget para que se pueda emitir en momento
// los eventos
class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool enReached = false;
  // parte del ciclo de vida de los statefulwidgets
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageViewController.addListener(() {
      // le ponemos el ?? 0 porque puede que se este construyendo
      final page = pageViewController.page ?? 0;
      if (!enReached && page >= (slides.length - 1.5)) {
        setState(() {
          enReached = true;
        });
      }
      print('${pageViewController.page}');
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageViewController.dispose();
    super.dispose();

    // Es casi obligatorio mandarlo a llamar cada que tenemos un listener
    // Con esto hacemos que libre memoria y venga mas ligera la aplicacion estos elementos
    // se utilzan en los Stateful widgets
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                      slideData.title, slideData.caption, slideData.imageUrl))
                  .toList(),
            ),
            Positioned(
                right: 20,
                top: 50,
                child: TextButton(
                  child: const Text('Exit'),
                  onPressed: () {
                    return context.pop();
                  },
                )),
            enReached
                ? Positioned(
                    bottom: 30,
                    right: 30,
                    child: FadeInRight(
                      from: 15,
                      delay: const Duration(seconds: 1),
                      child: FilledButton(
                        child: const Text('Start'),
                        onPressed: () {
                          return context.pop();
                        },
                      ),
                    ))
                : const SizedBox(),
          ],
        ));
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide(this.title, this.caption, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imageUrl),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              caption,
              style: captionStyle,
            )
          ],
        ),
      ),
    );
  }
}
