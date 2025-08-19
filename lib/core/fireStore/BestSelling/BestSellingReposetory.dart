import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/core/fireStore/BestSelling/BestSellingModel.dart';
import 'package:coffe_app/core/fireStore/Breads/BreadsModel.dart';


class Bestsellingreposetory {
  final FirebaseFirestore firestore;

  Bestsellingreposetory({required this.firestore});

  Stream<List<BestsellingModel>> getBestSelling() {
    return firestore.collection('BestSelling').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return BestsellingModel.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<void> addBreads(BestsellingModel breads) async {
// await firestore.collection('SmallPlanets').add(book.toMap());
final docRef = await firestore.collection('BestSellings').add(breads.toMap());

// حدّث الـ Coffee بالـ id
await docRef.update({'id': docRef.id});


  }

  Future<void> deleteBestSelling(String id) async {
    await firestore.collection('BestSellings').doc(id).delete();
  }
}