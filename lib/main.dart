import 'package:flutter/material.dart';
import 'package:flutter_movie_app/pages/home_page.dart';

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
      theme: ThemeData(
        fontFamily: 'Roboto-Black',
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

