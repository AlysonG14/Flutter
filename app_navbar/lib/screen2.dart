import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  width: 150,
                  height: 600,
                  color: Colors.red,
                ),
                Container(
                  width: 150,
                  height: 600,
                  color: Colors.blue,
                ),
                Container(
                  width: 150,
                  height: 600,
                  color: Colors.purple,
                ),
                Container(
                  width: 150,
                  height: 600,
                  color: Colors.deepOrange,
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}

