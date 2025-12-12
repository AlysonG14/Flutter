import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/book_model.dart';

class SaveBookService {
  static Future<void> saveBook(BookModel book) async {
    await FirebaseFirestore.instance.collection('books').add({
      "title": book.title,
      "image": book.image,
    });
  }
}
