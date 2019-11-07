import 'package:flutter/material.dart';
import 'package:planets/HomePage.dart';
import 'package:planets/Tasks.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => Tasks(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          accentColor: Colors.deepPurple
        ),
        home: HomePage(),
      ),
    );
  }
}
