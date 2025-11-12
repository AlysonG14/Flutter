import 'package:bancoapp/delete.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  // cria uma lógica
  TextEditingController novaTemperatura = TextEditingController(); //variavel que observa o que usuário digita
  TextEditingController novaUmidade = TextEditingController();

  // post precisa ser uma função do tipo futuro, porque a confirmação dos dados só acontece no FUTURO
  Future<void> postValue () async {
    FirebaseFirestore.instance.collection("moniotramento").add(
      {
        "temperatura": novaTemperatura.text,
        "umidade": novaUmidade.text
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent, title: Text('Post'),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                controller: novaTemperatura,
              ),
              ElevatedButton(onPressed: postValue, child: Text("Enviar dados")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DeletePage()));
              }, child: Text("Página Delete"))
            ],  
          ),
        ),
      )
    );
  }
}