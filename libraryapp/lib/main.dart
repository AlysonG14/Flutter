import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/home_page.dart';
import 'pages/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // inicializa o firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const Login());
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool keepSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF46009C), Color(0xFF00078F)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),

              // Logo
              Image.network(
                "https://images.vexels.com/media/users/3/229082/isolated/preview/6fabc24c3830d75486725cc6d786dfbb-logotipo-dos-circulos-do-livro.png",
                width: 200,
              ),

              const SizedBox(height: 40),

              // ---------- SIGN IN & SIGN UP ----------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SIGN IN",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xff0396D5),
                    ),
                  ),
                  const SizedBox(width: 50),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterUser(),
                        ),
                      );
                    },
                    child: const Opacity(
                      opacity: 0.5,
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                  vertical: 40,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Username
                    const Text(
                      "Username",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    _buildInputField("Name"),

                    const SizedBox(height: 30),

                    // Password
                    const Text(
                      "Password",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    _buildInputField("Password", obscure: true),

                    const SizedBox(height: 10),

                    // Checkbox
                    CheckboxListTile(
                      value: keepSignedIn,
                      onChanged: (value) {
                        setState(() => keepSignedIn = value!);
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text(
                        "Keep me Signed In",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0396D5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: const Text(
                          "SIGN IN",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Opacity(
                opacity: 1,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
      ),
    );
  }
}
