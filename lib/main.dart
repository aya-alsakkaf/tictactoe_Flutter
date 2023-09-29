import 'package:flutter/material.dart';
import 'package:tictactoe/Constants/colors.dart';
import 'package:tictactoe/Screens/home_screen.dart';

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
      title: 'Tic Tac Toe',
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Tic Tac Toe',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: annouceColor),
            ),
            centerTitle: true,
            backgroundColor: backgroundColor,
            elevation: 0,
          ),
          body: HomeScreen()),
    );
  }
}
