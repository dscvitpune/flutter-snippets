import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/video_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video player',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: ListView(
        children: <Widget>[
          ChewieListitem(
            videoPlayerController: VideoPlayerController.asset(
              'videos/samplevideo1.mp4',
            ),
            looping: true,
          ),
          ChewieListitem(
            videoPlayerController: VideoPlayerController.network(
              ' https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
            ),
            looping: true,
          ),
          ChewieListitem(
            videoPlayerController: VideoPlayerController.asset(
              'videos/samplevideo1.mp4',
            ),
            looping: true,
          ),
          ChewieListitem(
            videoPlayerController: VideoPlayerController.asset(
              'videos/sample-mp4-file.mp4',
            ),
            looping: true,
          ),
        ],
      ),
    );
  }
}
