import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> showEditBookDialog(BuildContext context, DocumentSnapshot book) async {
  final titleController = TextEditingController(text: book['title'] ?? '');
  final imageController = TextEditingController(text: book['image'] ?? '');
  final descriptionController = TextEditingController(text: book['description'] ?? '');

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Edit book"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: titleController, decoration: const InputDecoration(labelText: "Title")),
              TextField(controller: imageController, decoration: const InputDecoration(labelText: "Image (local path or URL)")),
              TextField(controller: descriptionController, decoration: const InputDecoration(labelText: "Description")),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () async {
              final newTitle = titleController.text.trim();
              final newImage = imageController.text.trim();
              final newDescription = descriptionController.text.trim();

              if (newTitle.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Title is required')));
                return;
              }

              try {
                await FirebaseFirestore.instance.collection('books').doc(book.id).update({
                  'title': newTitle,
                  'image': newImage,
                  'description': newDescription,
                });

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Book updated successfully!")));
              } catch (e) {
                debugPrint('Error updating book: $e');
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error updating book")));
              }
            },
            child: const Text("Save"),
          ),
        ],
      );
    },
  );
}
