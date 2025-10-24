import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xf0D9D9D9)),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Photoby", style: TextStyle(color: Color(0xffffffff))),
          backgroundColor: Color(0xf03B3B3B),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                ],
              ),
              SizedBox(width: 150,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 1, height: 5),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("", width: 50, height: 50),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
