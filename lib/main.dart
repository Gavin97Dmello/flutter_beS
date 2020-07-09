import 'package:flutter/material.dart';
import 'package:beSomeone/services/RouteGenerator.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      // Initially display FirstPage
      initialRoute: '/Feed',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

