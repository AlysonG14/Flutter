import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  String? value;

  @override
  void initState(){ // funcao que recarrega o estado da página
  //toda vez ao iniciar a página

    super.initState();
    getvalue(); //funcao que busca o valor, será resetada sempre ao iniciar o app
  }

  void getvalue(){
    
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}