// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coffe_app/core/fireStore/Dessert/DessertModel.dart';



// class DessertReposatory {
//   final FirebaseFirestore firestore;

//   DessertReposatory({required this.firestore});

//   Stream<List<DessertModel>> getDesserts() {
//     return firestore.collection('Desserts').snapshots().map((snapshot) {
//       return snapshot.docs.map((doc) {
//         return DessertModel.fromMap(doc.data(), doc.id);
//       }).toList();
//     });
//   }

//   Future<void> addDessert(DessertModel dessert) async {
// // await firestore.collection('SmallPlanets').add(book.toMap());
// final docRef = await firestore.collection('Desserts').add(dessert.toMap());

// // حدّث الـ Coffee بالـ id
// await docRef.update({'id': docRef.id});


//   }

//   Future<void> deleteBook(String id) async {
//     await firestore.collection('Coffees').doc(id).delete();
//   }
// }