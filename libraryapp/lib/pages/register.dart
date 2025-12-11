import 'package:app_photoby/main.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import '../main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegisterUser(),
    );
  }
}

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const Opacity(
                      opacity: 0.5,
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 50),
                  Text(
                    "SIGN UP",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xff0396D5),
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
                    // First Name
                    const Text(
                      "First Name",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    _buildInputField("First Name"),

                    const SizedBox(height: 30),

                    const Text(
                      "Last Name",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    _buildInputField("Last Name"),

                    const SizedBox(height: 30),

                    const Text(
                      "Email",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    _buildInputField("Email"),

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
                        "Accept Terms & Conditions",
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
                              builder: (context) => const Login(),
                            ),
                          );
                        },
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
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
