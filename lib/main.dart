import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // É a função que roda o APP.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Page"),
        ), // É a barra superior da tela (nav bar).
        body: Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ), // Conteúdo da tela
      ),
    );
  }
}
