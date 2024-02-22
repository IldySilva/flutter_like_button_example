import 'package:flutter/material.dart';

import 'package:like_button/like_button.dart';
import 'package:parallax_rain/parallax_rain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lightBlueAccent, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const SafeArea(child: Scaffold(body: App())),
    );
  }
}

var _liked = false;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  final Key parallaxOne = GlobalKey();
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Text(
            "Animated Like Button",
            style: TextStyle(fontSize: 25),
          ),
          LikeButton(
            isLiked: _liked,
            size: 80,
            likeBuilder: (liked) {
              return Icon(
                color: liked ? Colors.lightBlueAccent : Colors.grey,
                Icons.favorite,
                size: 80,
              );
            },
          ),
          LikeButton(
            isLiked: _liked,
            size: 80,
            circleColor:
                const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
            bubblesColor: const BubblesColor(
              dotPrimaryColor: Color(0xff33b5e5),
              dotSecondaryColor: Color(0xff0099cc),
            ),
            likeBuilder: (liked) {
              return Icon(
                color: liked ? Colors.lightBlueAccent : Colors.grey,
                Icons.flutter_dash,
                size: 80,
              );
            },
          ),
          LikeButton(
            circleColor: const CircleColor(
                start: Colors.lightBlueAccent, end: Colors.black38),
            bubblesColor: const BubblesColor(
                dotPrimaryColor: Colors.black12,
                dotSecondaryColor: Colors.lightBlueAccent),
            isLiked: _liked,
            size: 80,
            likeBuilder: (liked) {
              return Icon(
                color: liked ? Colors.lightBlueAccent : Colors.grey,
                Icons.thumb_up_off_alt_rounded,
                size: 80,
              );
            },
          ),
        ]),
      ],
    );
  }
}
