import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/core/fireStore/Breads/BreadsModel.dart';


class Breadsreposatory {
  final FirebaseFirestore firestore;

  Breadsreposatory({required this.firestore});

  Stream<List<BreadsModel>> getBreads() {
    return firestore.collection('Breads').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return BreadsModel.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<void> addBreads(BreadsModel breads) async {
// await firestore.collection('SmallPlanets').add(book.toMap());
final docRef = await firestore.collection('Breads').add(breads.toMap());

// حدّث الـ Coffee بالـ id
await docRef.update({'id': docRef.id});


  }

  Future<void> deleteFlowers(String id) async {
    await firestore.collection('Flowers').doc(id).delete();
  }
}