import 'package:flutter/material.dart';
import 'package:slider_animation/screens/slider_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slider Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const SliderAnimation(),
    );
  }
}
