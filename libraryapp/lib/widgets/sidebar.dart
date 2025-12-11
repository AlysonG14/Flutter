import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final bool isMobile;
  const Sidebar({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      // Barra inferior (mobile): mantém estilo do sidebar mas em linha
      return Container(
        height: 90,
        decoration: const BoxDecoration(
          color: Color(0xFF0D79B4),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _mobileItem(Icons.menu_book, "Re-ader"),
            _mobileIcon(Icons.home),
            _mobileIcon(Icons.explore),
            _mobileIcon(Icons.settings),
          ],
        ),
      );
    }

    // Desktop vertical sidebar
    return Container(
      width: 240,
      color: const Color(0xFF0D79B4),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          Row(
            children: const [
              Icon(Icons.menu_book, color: Colors.white, size: 35),
              SizedBox(width: 10),
              Text(
                "Re-ader",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          _item(Icons.home, "Home"),
          _item(Icons.explore, "Discover"),
          _item(Icons.settings, "Settings"),
        ],
      ),
    );
  }

  Widget _item(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }

  Widget _mobileItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ],
    );
  }

  Widget _mobileIcon(IconData icon) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white, size: 28),
    );
  }
}
