import 'package:flutter/material.dart';
import 'package:flutterapp/view/TodosPage.dart';
import 'package:get/get.dart'; // Import GetX


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Ganti MaterialApp dengan GetMaterialApp
      title: 'HTTP Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Route awal, bisa disesuaikan
      getPages: [
        GetPage(name: '/', page: () => TodosPage()), // Tambahkan routing untuk TodosPage
      ],
    );
  }
}