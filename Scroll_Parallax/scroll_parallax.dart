import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double rate = 0;
  double offset_top = 0;
  double offset_left = 250;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: NotificationListener(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              setState(() {
                rate += notification.scrollDelta / 1.5;
                print(rate);
              });
            }
          },
          child: ListView(
            children: [
              //Anirudh Part
              Container(
                height: 500,
                color: Colors.red,
              ),
              //Gallery Part
              Container(
                color: Colors.blue,
                height: 400,
                child: Stack(
                  children: [
                    Parallax_Widget(
                      rate: rate,
                      offset_top: offset_top - 200,
                      offset_left: offset_left - 250,
                      height: 200,
                    ),
                    Parallax_Widget(
                      rate: rate,
                      offset_top: offset_top - 350,
                      offset_left: offset_left - 250,
                      height: 100,
                    ),
                    Parallax_Widget(
                      rate: rate,
                      offset_top: offset_top,
                      offset_left: offset_left,
                      height: 200,
                    ),
                    Parallax_Widget(
                      rate: rate,
                      offset_top: offset_top - 100,
                      offset_left: offset_left + 250,
                      height: 200,
                    ),
                    Parallax_Widget(
                      rate: rate,
                      offset_top: offset_top - 250,
                      offset_left: offset_left,
                      height: 200,
                    ),
                    Parallax_Widget(
                      rate: rate,
                      offset_top: offset_top - 300,
                      offset_left: offset_left + 250,
                      height: 150,
                    ),
                  ],
                ),
              ),
              //Lavkik's Part
              Container(
                height: 500,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Parallax_Widget extends StatelessWidget {
  const Parallax_Widget({
    Key key,
    @required this.rate,
    @required this.offset_top,
    @required this.offset_left,
    @required this.height,
  }) : super(key: key);

  final double rate;
  final double offset_top;
  final double offset_left;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: rate + offset_top,
        left: rate + offset_left,
        child: Container(
          height: height,
          width: 200,
          //color: Colors.black,
          child: Image.network(
            "https://source.unsplash.com/random",
            fit: BoxFit.cover,
          ),
        ));
  }
}
