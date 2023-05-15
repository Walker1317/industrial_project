import 'package:flutter/material.dart';
import 'package:industrial_project/base_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  Brightness brightness = Brightness.light;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent[700]!),
          ),
          errorBorder: const OutlineInputBorder(),
        ),
        primarySwatch: Colors.green,
        
      ),
      home: const BaseScreen(),
    );
  }
}