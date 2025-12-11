import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../widgets/sidebar.dart';
import '../../widgets/banner_widget.dart';
import '../../widgets/book_card.dart';
import '../../widgets/search_bar_widget.dart';
import '../../widgets/add_card.dart';
import '../../dialogs/edit_book_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;

        return Scaffold(
          body: Row(
            children: [
              if (!isMobile) const Sidebar(),

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
                            return const Center(child: Text("Something went wrong"));
                          }

                          final books = snapshot.data?.docs ?? [];

                          return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: isMobile ? 1 : 3,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 0.85,
                            ),
                            itemCount: books.length + 1,
                            itemBuilder: (context, index) {
                              if (index == books.length) {
                                return const AddCard();
                              }

                              final book = books[index];

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
                                onEdit: () {
                                  showEditBookDialog(context, book);
                                },
                              );
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),

          bottomNavigationBar: isMobile
              ? const Sidebar(isMobile: true)
              : null,
        );
      },
    );
  }
}
