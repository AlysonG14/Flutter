class BookModel {
  final String title;
  final String image;

  BookModel({
    required this.title,
    required this.image,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final coverId = json["cover_i"];

    final image = coverId != null
        ? "https://covers.openlibrary.org/b/id/$coverId-L.jpg"
        : "https://via.placeholder.com/200x300?text=No+Image";

    return BookModel(
      title: json["title"] ?? "Sem título",
      image: image,
    );
  }
}
