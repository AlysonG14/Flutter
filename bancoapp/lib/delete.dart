import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

class DeletePage extends StatefulWidget {
  const DeletePage({super.key});

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  List<dynamic>? values; //lista que irá armazenar todos os dados.

  @override
  initState() {
    super.initState();
    getValues();
  }

  void getValues() {
    FirebaseFirestore.instance.collection("moniotramento").snapshots().listen((
      snapshots,
    ) {
      final data = snapshots.docs;
      setState(() {
        values = data;
      });
    });
  }

  Future<void> deleteValue(String id) async {
    FirebaseFirestore.instance.collection("moniotramento").doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Tela de Delete")),
        body: values == null ? Center(child: CircularProgressIndicator(),) : 
        ListView.builder( // reconstrutor de objetos
        itemCount: values!.length , // quantos objetos irei fazer?
        itemBuilder: (context, index){ // o que irei construir para cada objeto?
          final item = values![index];
          return ListTile(
            title: Text("Temperatura registrada"),
            subtitle: Text("${item["temperatura"]}"),
            trailing: GestureDetector(
              child: Icon(Icons.remove),
              onTap: () {
                deleteValue(item.id);
              },
            ),
          );
        },
        )
      ),
    );
  }
}
