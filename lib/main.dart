import 'package:flutter/material.dart';
import 'package:todo_app/screens/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<String> todo = ["Study Lessons", "Run 5K", "Go to party"];
List<String> completed = ["Game meetup", "Take out tash"];

class _MyAppState extends State<MyApp> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
 

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
