import 'package:f_202010_todo_class/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageTodo(),
    );
  }
}
