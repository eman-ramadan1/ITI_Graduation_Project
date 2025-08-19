class BestsellingModel {
  final String id;
  final String name;
  
  final String category;
  final double price;
  final String imageUrl;
  final String description;

  BestsellingModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    this.description='',
  });
///
  factory BestsellingModel.fromMap(Map<String, dynamic> map, String documentId) {
    return BestsellingModel(
      id: documentId,
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      imageUrl: map['imageUrl'] ?? '',
      description: map['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
    };
  }
}