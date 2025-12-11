import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> _addBook(BuildContext context) async {
    final title = titleController.text.trim();
    final image = imageController.text.trim();
    final description = descriptionController.text.trim();

    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Title is required')));
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('books').add({
        'title': title,
        'image': image,
        'description': description,
        'createdAt': FieldValue.serverTimestamp(),
      });

      Navigator.pop(context); // fecha o dialog
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Book added successfully!')));
    } catch (e) {
      debugPrint('Error adding book: $e');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error adding book')));
    }
  }

  void _openAddDialog() {
    titleController.clear();
    imageController.clear();
    descriptionController.clear();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add new book"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(controller: titleController, decoration: const InputDecoration(labelText: "Title")),
                TextField(controller: imageController, decoration: const InputDecoration(labelText: "Image (url or asset path)")),
                TextField(controller: descriptionController, decoration: const InputDecoration(labelText: "Description")),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
            ElevatedButton(onPressed: () => _addBook(context), child: const Text("Save")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openAddDialog,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black26),
        ),
        child: const Center(child: Icon(Icons.add, size: 40, color: Colors.black54)),
      ),
    );
  }
}
