import 'package:flutter/material.dart';

void main() {
  runApp(const Counter());
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Counter> {
  // Você começa a desenvolver a linguagem de programação chamado Dart
  // Para codar e criar funções para o mobile
  int valor = 0;

  void aumentar() {
    setState(() {
      valor++;
    });
    }

  void resetar(){
    setState(() {
      valor = 0;
    });
  }
  void diminuir(){
    setState(() {
      valor--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // tira o debugg
      // Fornece os componentes
      home: Scaffold(
        // Divide entre app bar e body
        appBar: AppBar(title: Text("Hello, Counter!")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${valor.toInt()}", style: TextStyle(fontSize: 80),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {aumentar();}, child: Icon(Icons.add)),
                SizedBox(width: 20),
                ElevatedButton(onPressed: () {resetar();}, child: Icon(Icons.restore)),
                SizedBox(width: 20),
                ElevatedButton(onPressed: () {diminuir();}, child: Icon(Icons.remove)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
