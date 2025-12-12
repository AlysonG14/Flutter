import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/book_model.dart';

class BookAPI {
  static Future<List<BookModel>> fetchBooks(String search) async {
    final url =
        Uri.parse("https://openlibrary.org/search.json?q=$search");

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar livros");
    }

    final data = jsonDecode(response.body);
    final docs = data["docs"] ?? [];

    return docs
        .map<BookModel>((json) => BookModel.fromJson(json))
        .toList();
  }
}
