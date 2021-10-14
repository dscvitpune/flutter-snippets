import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final double _boxSize = 1000.0;
  Animation<double> animation;
  AnimationController controller;
  Offset _scroll = Offset(0, 0);

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInQuad)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.red,
            child: Column(
              children: [
                myAnimatePhoto(
                  animation: animation,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class myAnimatePhoto extends AnimatedWidget {
  myAnimatePhoto({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  Offset _scroll = Offset(0, 0);
  static final _myTween = Tween<double>(begin: 0.1, end: 100);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final animation = listenable as Animation<double>;
    return Transform.translate(
      offset:
          Offset(_myTween.evaluate(animation), _myTween.evaluate(animation)),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: FlutterLogo(),
      ),
    );
  }
}
