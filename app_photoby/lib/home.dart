import 'package:flutter/material.dart';


class homoPage extends StatefulWidget {
  const homoPage({super.key});

  @override
  State<homoPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<homoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Photoby', style: TextStyle(fontSize: 30, color: Colors.white)),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(500),
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg', width: 100,
                  ),
                ),
                Text(
                  "Photoby",
                  style: TextStyle(color: Colors.grey, fontSize: 50 ),
                ),
                SizedBox(
                  width: 500,
                )
              ],
                )
          ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(20),
                      child: Image.network(
                        "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg", width: 100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(20),
                      child: Image.network(
                        "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg", width: 100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ];
      );
    );
  }
}
