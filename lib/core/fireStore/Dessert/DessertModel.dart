// class DessertModel {
//   final String id;
//   final String name;
  
//   final double price;
//   final String imageUrl;
//   final String description;

//   DessertModel({
//     required this.id,
//     required this.name,
    
//     required this.price,
//     required this.imageUrl,
//     this.description='',
//   });

//   factory DessertModel.fromMap(Map<String, dynamic> map, String documentId) {
//     return DessertModel(
//       id: documentId,
//       name: map['title'] ?? '',
     
      
//       price: (map['price'] ?? 0).toDouble(),
//       imageUrl: map['imageUrl'] ?? '',
//       description: map['description'] ?? '',
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
      
   
//       'price': price,
//       'imageUrl': imageUrl,
//       'description': description,
//     };
//   }
// }