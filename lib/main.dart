import 'package:active4c/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'screens/loginScreen.dart'; // Pastikan path ini sesuai dengan lokasi file LoginScreen.dart Anda

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      title: 'Active4C',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(), 
    );
  }
}
