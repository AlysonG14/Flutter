import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const BookCard({
    super.key,
    required this.image,
    required this.title,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width is controlled by the Grid; avoid forcing huge width
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black12)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // altura controlada para evitar espaços
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 160,
              child: (image.startsWith('http') || image.startsWith('https'))
                  ? Image.network(image, fit: BoxFit.cover, errorBuilder: (c, e, s) {
                      return const Center(child: Icon(Icons.broken_image, size: 48));
                    })
                  : Image.asset(image, fit: BoxFit.cover, errorBuilder: (c, e, s) {
                      return const Center(child: Icon(Icons.broken_image, size: 48));
                    }),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.orange),
                onPressed: onEdit,
                tooltip: 'Edit book',
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
                tooltip: 'Delete book',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
