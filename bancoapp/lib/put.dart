import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PutPage extends StatefulWidget {
  const PutPage({super.key});

  @override
  State<PutPage> createState() => _PutPageState();
}

class _PutPageState extends State<PutPage> {
  Map<String, TextEditingController> controladores = {}; // usamos um map para que cada item tenha sua variável observadora.

  List<dynamic>? values; // crio uma lista dos valores que recebo do banco

  @override
  void initState(){ // reinicia o estado da página para manter os dados atualizados
    super.initState();
    getValues();
    
  }

  void getValues(){
    FirebaseFirestore.instance.collection("moniotramento").snapshots().listen(
      (snapshots){
        final data = snapshots.docs;
        setState(() {
          values = data;
            for(dynamic doc in data){ // para cada documento dentro da lista, crio um controlador
              controladores[doc.id] = TextEditingController();
            }
        });
      }
    );
  }

  Future<void> putValue(String id) async {
    FirebaseFirestore.instance.collection("moniotramento").doc(id).set(
      {
        
        "temperatura": controladores[id]!.text,

      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Tela Put"),),
        body: values == null? Center(child: CircularProgressIndicator()) : 
        ListView.builder(
          itemCount: values!.length,
          itemBuilder: (context,index){
            final item = values![index];

            return ListTile(
              title: Text("Temperatura ${item["Temperatura"]}"),
              subtitle: Column(
                children: [
                  TextField(controller: controladores[item.id]),
                  ElevatedButton(onPressed: (){putValue(item.id);}, child: Text("Alterar"))
                ],
              ),  
            );
          },
        )
      ),
    );
  }  
}