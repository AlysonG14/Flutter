import 'package:app_assets/tela2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaHome()
    );
  }
}

class TelaHome extends StatelessWidget {
  const TelaHome ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.luckiestGuyTextTheme() // Vai definir todo o tema do flutter
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("App Assets"),),
        body: Center( // Ajuda centralizar
          child: Column( // Objetos um abaixo do outro
          mainAxisAlignment: MainAxisAlignment.center,
            children: [ // Filhos de coluna 
              Row( // Disposição em linha
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network("https://th.bing.com/th/id/R.99e57739c62076c2a8c3207ef1beb032?rik=yQSx0diQ6JaCfw&riu=http%3a%2f%2f4.bp.blogspot.com%2f-MoXzDn2XBKk%2fThYs64F4qxI%2fAAAAAAAACWM%2ftrVP_C4F_WE%2fs1600%2fbela-paisagem-sobre-montanhas-em-tons-verdes-imagens-imagem-de-fundo-wallpaper-para-pc-computador-tela-gratis-ambiente-de-trabalho.jpg&ehk=C10PBgU9bLSTISXoDDgWa1f8TrXudC149Euqf0H6b7c%3d&risl=&pid=ImgRaw&r=0", width: 600,),
                  SizedBox(width: 70,),
                  Image.asset("assets/images/awesome-pictures-k287z98ruunquo28.jpg", width: 665,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Image 01"), 
                  SizedBox(width: 650, height: 50,),
                  Text("Image 02")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Fonte Baixada:", style: 
                  TextStyle(fontFamily: "honkinho", fontSize: 80) // Fonte asset
                  ),

                  SizedBox(width: 50,),

                  Text("Fonte biblioteca", style: 
                  GoogleFonts.roboto(fontSize: 30),) // Fonte biblioteca
              ],
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Tela2()));
              }, child: Text("Go to the 2° screen"))
            ],
          ),
        )
      ),
    );
  }
}