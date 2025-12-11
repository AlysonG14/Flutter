import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void openEditDialog(BuildContext context, DocumentSnapshot book) {
    final titleController = TextEditingController(text: book['title']);
    final imageController = TextEditingController(text: book['image']);
    final descriptionController = TextEditingController(
      text: book['description'],
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit book"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: "Title"),
                ),
                TextField(
                  controller: imageController,
                  decoration: const InputDecoration(
                    labelText: "Image (local path or URL)",
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: "Description"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                // Atualiza o livro no Firestore
                await FirebaseFirestore.instance
                    .collection('books')
                    .doc(book.id)
                    .update({
                      'title': titleController.text,
                      'image': imageController.text,
                      'description': descriptionController.text,
                    });

                Navigator.pop(context); // fecha o diálogo
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Book updated successfully!")),
                );
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchBarWidget(),
                  const SizedBox(height: 20),
                  const BannerWidget(),
                  const SizedBox(height: 25),
                  const Text(
                    "Your books",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('books')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return const Center(
                          child: Text("Something went wrong"),
                        );
                      }

                      var books = snapshot.data?.docs ?? [];

                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 0.85,
                            ),
                        itemCount: books.length + 1,
                        itemBuilder: (context, index) {
                          if (index == books.length) {
                            return AddCard();
                          }

                          var book = books[index];

                          return BookCard(
                            image: book['image'],
                            title: book['title'],
                            onDelete: () async {
                              await FirebaseFirestore.instance
                                  .collection('books')
                                  .doc(book.id)
                                  .delete();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Book deleted!')),
                              );
                            },
                            onEdit: () => openEditDialog(context, book),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
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
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Row(
        children: const [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search the book",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.orange.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          "BOOK CLUB",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

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
      width: 210,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 500,
              child: Image.network(
                image,
                fit: BoxFit.contain, // evita cortar a imagem
              ),
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
                iconSize: 40,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
                tooltip: 'Delete book',
                iconSize: 40,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddCard extends StatelessWidget {
  AddCard({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> addBook(BuildContext context) async {
    try {
      await FirebaseFirestore.instance.collection('books').add({
        'title': titleController.text,
        'image': imageController.text,
        'description': descriptionController.text,
      });

      Navigator.pop(context); // fecha o pop-up
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Book added successfully!")));
    } catch (e) {
      print("Error adding book: $e");
    }
  }

  void openAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add new book"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: "Title"),
                ),
                TextField(
                  controller: imageController,
                  decoration: const InputDecoration(
                    labelText: "Image (local path or URL)",
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: "Description"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () => addBook(context),
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openAddDialog(context),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black26),
        ),
        child: const Center(
          child: Icon(Icons.add, size: 40, color: Colors.black54),
        ),
      ),
    );
  }
}
