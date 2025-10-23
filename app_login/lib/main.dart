import 'package:app_logi/api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// essa vai ser o myapp geral

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage()
    );
  }
}



// página de login page, onde devemos importar uma classe para página de login

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // variavel que observa o que o usuário digita

  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();

  // variavel com as informações corretas

  String correctUser = "alyson";
  String correctPassword = '123456'; // apenas strings, porque fica mais fácil de puxar as informações corretas dentro do campo
  
  // variavel para mostrar o erro
  String error = '';

  // função para validar as informações
  void login() {
    if(user.text == correctUser && password.text == correctPassword){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ApiPage()));
    } else {
      setState(() { // setState => altera o estado das informações
        error = 'existem credencias erradas';
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.lightBlue),
      home: Scaffold(
        body: Center( // center -> existe apenas um único filho
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(maxWidth: 130, maxHeight: 130),
                  color: const Color.fromARGB(255, 0, 85, 128),
                  child: Icon(Icons.person, size: 100, color: const Color.fromARGB(255, 248, 248, 248),),
                )
              ),
              Text("User", style: TextStyle(fontSize: 50),),

              // user

              //Text("User", style: TextStyle(fontSize: 30, ),),
              //SizedBox(height: 20,),

              Padding(padding: EdgeInsets.symmetric(horizontal: 680), // padding -> esse elemento vai criar um widget que adiciona um espaçamento interno nas laterais de esquerda e direita do seu widghet filho
                                                                      // edgeinsets.symetrics -> aplica o espaçamento do lados opostos, que seja na parte hori. ou vert.
              child: // container filho
               TextField(
                controller: user, // variavel que observa o que o usuário digite
                maxLength: 150, // maximo de caracteres digitados
                decoration: InputDecoration(
                  labelText: 'Nome', // insere uma label, que indica dentro do "placeholder" que você criou
               // hintText
                  border: OutlineInputBorder( // cria a borda
                    borderRadius: BorderRadius.circular(20), // faz uma borda com circuferência ao redor do campo 
                    borderSide: BorderSide( // cor da borda
                      color: Colors.blue
                    )
                  )
                ),
              ),
              
              ),

              SizedBox(height: 15,),

              // password

              //Text("Password", style: TextStyle(fontSize: 30),),
              //SizedBox(height: 20,),
              
              Padding(padding: EdgeInsets.symmetric(horizontal: 680), // padding -> esse elemento vai criar um widget que adiciona um espaçamento interno nas laterais de esquerda e direita do seu widghet filho
                                                                      // edgeinsets.symetrics -> aplica o espaçamento do lados opostos, que seja na parte hori. ou vert.
              child:
              TextField(
                obscureText: true, // deixa a sua senha privada ***********
                controller: password, // variavel que observa o que o usuário digite
                maxLength: 150, // maximo de caracteres digitados
                decoration: InputDecoration(
                  labelText: 'Senha', // insere uma label, que indica dentro do "placeholder" que você criou
                // hintText
                  border: OutlineInputBorder( // cria a borda
                    borderRadius: BorderRadius.circular(20), // faz uma borda com circuferência ao redor do campo 
                    borderSide: BorderSide( // cor da borda
                      color: Colors.blue
                    )
                  ),
                ),
              ),
              ),

              ElevatedButton(onPressed: login, child: Text("Login")), // elevatedbutton ->  adiciona o botão
              Text("$error")
            ],
          ),
        )
      ),
    );
  }
}
