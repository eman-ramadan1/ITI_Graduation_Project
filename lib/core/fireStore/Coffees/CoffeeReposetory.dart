import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/core/fireStore/Coffees/CoffeeModel.dart';



class CoffeeRepository {
  final FirebaseFirestore firestore;

  CoffeeRepository({required this.firestore});

  Stream<List<  CoffeeModel>> getCoffee() {
    return firestore.collection('Coffee').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return CoffeeModel.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<void> addCoffee(CoffeeModel coffee) async {
    final docRef = await firestore.collection('Coffee').add(coffee.toMap());
    await docRef.update({'id': docRef.id}); // تحديث id
  }

  Future<void> deleteCoffee(String id) async {
    await firestore.collection('Coffee').doc(id).delete();
  }
}