import 'package:flutter/material.dart';

import 'features/splach/splach_screen.dart';

void main() {
  runApp( TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lexend Deca',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body:SplachScreen(),
      ));
  }
}
