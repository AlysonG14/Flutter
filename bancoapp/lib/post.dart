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


  // post precisa ser uma função do tipo futuro, porque a confirmação dos dados só acontece no FUTURO
  Future<void> postValue () async {
    FirebaseFirestore.instance.collection("moniotramento").add(
      {
        "temperatura": novaTemperatura.text
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}