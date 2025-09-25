import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Console Controller",style: TextStyle(fontSize: 60,color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.purple,
        toolbarHeight: 150,
        ),  
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Eixo Y
          crossAxisAlignment: CrossAxisAlignment.center, // Eixo X
          // Elementos um abaixo do outro
          children: [
            Container(
                    // double infinity -> É o máximo e infinito da width ou height 
              width: MediaQuery.of(context).size.width * 0.1, // Porcentagem 
              height: MediaQuery.of(context).size.width * 0.1, // Porcentagem
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(255, 255, 8, 8), // -> 0XF (obrigatório), o famoso "#"
              ),

              // child: Center(
              //   child: Text("Play", style: TextStyle(fontSize: 20)),
              // ),

            ),
            Container(
              width: 50,
              height: 50,
              color: Color.fromARGB(255, 95, 14, 14),
            ),
            Container(
              width: 50,
              height: 50,
              color: Color.fromARGB(255, 70, 10, 10)
            ),
            Container(
              width: 50,
              height: 50,
              color: Colors.black,

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Eixo X
              crossAxisAlignment: CrossAxisAlignment.center, // Eixo Y
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Color.fromARGB(255, 34, 34, 34),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: const Color.fromARGB(255, 34, 34, 34),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Color.fromARGB(255, 34, 34, 34),
                )
              ],
            )
          ],
        ),
      ), // Quem separa o app em até 3 partes. Appbar/Body/Footer
    ); // Quem vai prover os componentes para a sua tela
  }
}
