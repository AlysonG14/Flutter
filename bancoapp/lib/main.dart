import 'package:bancoapp/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // importa a biblioteca
import 'firebase_options.dart'; // importa o arquivo no banco

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // inicializa os componentes da sua tela
  await Firebase.initializeApp( // inicializa o firebase
    options: DefaultFirebaseOptions.currentPlatform, 
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaGet(

      ),
    );
  }
}

class TelaGet extends StatefulWidget {
  const TelaGet({super.key});

  @override
  State<TelaGet> createState() => _TelaGetState();
}

class _TelaGetState extends State<TelaGet> {
  // faça a sua logica aqui BORRACHUDO
    String? variavel;
    double? temperatura; // variavel que irá receber o valor do banco
    double? umidade;

    @override
    void initState() { // funcao que reinicia ou vola ao estado inicial
    super.initState();
    getValue();
    }

    void getValue() async {
      // crio uma instância da coleção do monitoramento
      // snapshots --> os meus retornos
      // listen --> irei listar
        FirebaseFirestore.instance.collection("moniotramento").snapshots().listen(
          (snapshot){
            //o primeiro retorno pego as informações dele e coloco em uma variável
            final data = snapshot.docs.first.data(); // retorna os dados
            
            // muda o estado da temperatura, para ser equivalente ao campo do documento
            setState(() {
              variavel = data["variavel"];
              temperatura = data["temperatura"];
              umidade = data["umidade"];

            });
          }
        ); // uma coleção que acabou de criar na firebase 
    }


  @override
  Widget build(BuildContext context) {
    return temperatura == null ? Center(child: CircularProgressIndicator())
    : Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Text("${temperatura!.toDouble()}", style: TextStyle(color: Colors.lightBlue), ),
      ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> PostPage()));
      }, child: Text("Página de Post"))
    ],),);  
  }
}