import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter Containers',
            style: TextStyle(fontSize: 60, color: Colors.black),
          ),
          centerTitle: true,
          toolbarHeight: 150,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(width: 6.0,color: Colors.black),
                    color: Colors.purpleAccent
                    //color: Colors.purpleAccent,
                  ),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(width: 20), // Igual um Gap -> Agrupamento de linha

                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.purpleAccent,
                  ),
                  child: Center(
                    child: Text(
                      "2",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Igual um Gap -> Agrupamento de linha
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.purpleAccent,
                  ),
                  child: Center(
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(width: 20), // Igual um Gap -> Agrupamento de linha

                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.purpleAccent,
                  ),
                  child: Center(
                    child: Text(
                      '4',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
                Image.network("https://images.theconversation.com/files/45159/original/rptgtpxd-1396254731.jpg?ixlib=rb-4.1.0&q=45&auto=format&w=1356&h=668&fit=crop", width: 150)
          ],
        ),
      ),
    );
  }
}
