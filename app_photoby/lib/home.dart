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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network("https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=612x612&w=0&k=20&c=A63koPKaCyIwQWOTFBRWXj_PwCrR4cEoOw2S9Q7yVl8=", width: 300, height: 300),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network("https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630", width: 300, height: 200),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network("https://i0.wp.com/picjumbo.com/wp-content/uploads/calming-nature-wallpaper-free-image.jpeg?w=600&quality=80", width: 300, height: 300),
                  ),
                ],
              ),
              SizedBox(width: 150,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network("https://cdn.pixabay.com/photo/2019/06/26/09/52/shit-image-4300034_1280.jpg", width: 300, height: 300),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCC38kJHL7PuSL6kfO2J7lybd1KNPq2lUscg&s", width: 350, height: 200),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network("https://burst.shopifycdn.com/photos/beach-sunset-thailand.jpg?width=1000&format=pjpg&exif=0&iptc=0", width: 300, height: 300),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
