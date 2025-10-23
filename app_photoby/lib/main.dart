import 'package:app_photoby/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Photography());
  }
}

class Photography extends StatefulWidget {
  const Photography({super.key});

  @override
  State<Photography> createState() => _MyWidgetState();
}

void navigate() {}

class _MyWidgetState extends State<Photography> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xff3B3B3B)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  // ClipRRect ->
                  borderRadius: BorderRadius.circular(500),
                  child: Image.asset('assets/images/camera.jpeg', width: 250),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Photoby",
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ],
                ), // Form -> Nome
                Text(
                  "Nome",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nome",
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],
            ), // Form -> Senha
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Senha",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Senha",
                    ),
                  ),
                ),
              ],
            ),
            Column(
              // Botão de Formulário -> para direcionar no outro navegador
              children: [
                SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
