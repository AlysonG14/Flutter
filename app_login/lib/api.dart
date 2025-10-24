import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  String? value;

  @override
  void initState() {
    // funcao que recarrega o estado da página
    //toda vez ao iniciar a página

    super.initState();
    getvalue(); //funcao que busca o valor, será resetada sempre ao iniciar o app
  }

  void getvalue() async {
    // funcao que pega o valor do http, precisa ser assíncrona
    final response = await http.get(
      Uri.parse("https://viacep.com.br/ws/01001000/json/"),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        // possibilita mudar o estado da variavel
        value = data["logradouro"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // você pode fazer conjuntos de componentes para cada ocasião
        body: Column(  
          children: [
          value == null
            ? Center(child: CircularProgressIndicator())
            : Center(child: Center(child: Text("$value"))),
            ElevatedButton(onPressed: onPressed, child: child)
          ]
        )
      ),
    );
  }
}
