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