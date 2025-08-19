// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coffe_app/core/fireStore/Dessert/DessertModel.dart';



// Future<void> smallDessertsSeed(FirebaseFirestore firestore) async {
//   List<DessertModel> desserts = [
//     DessertModel(
//       id: '',
//       name: "Baklava",
//       description: "Layers of filo pastry filled with nuts and sweetened with honey.",
//       price: 4.5,
//       imageUrl: "https://images.unsplash.com/photo-1624353367001-7b6b26d3f1bb",
//     ),
//     DessertModel(
//       id: '',
//       name: "Basbousa",
//       description: "Semolina cake soaked in sweet syrup, often topped with almonds.",
//       price: 3.0,
//       imageUrl: "https://images.unsplash.com/photo-1656601448270-f40e1f0c9b35",
//     ),
//     DessertModel(
//       id: '',
//       name: "Kunafa",
//       description: "Cheese or cream-filled dessert topped with shredded pastry and syrup.",
//       price: 5.0,
//       imageUrl: "https://images.unsplash.com/photo-1625944574548-50a24d2648a6",
//     ),
//     DessertModel(
//       id: '',
//        name: "Maamoul",
  
//     description: "Stuffed shortbread cookies with dates, nuts, or figs.",
//     price: 4.0,
//     imageUrl: "https://images.unsplash.com/photo-1625758471416-ec4d6b8dfd52",
//     ),
//     DessertModel(
//       id: '',
//       name: "Qatayef",
  
//     description: "Stuffed pancakes, often served during Ramadan.",
//     price: 3.5,
//     imageUrl: "https://images.unsplash.com/photo-1656601448127-d563ed2ef39b",
//     ),
//     DessertModel(
//       id: '',
//        name: "Halva",
    
//     description: "Dense sweet confection made from tahini and sugar.",
//     price: 2.8,
//     imageUrl: "https://images.unsplash.com/photo-1609750583868-4a2bda5f7f71",
//     ),
//     DessertModel(
//       id: '',
//        name: "Zalabia",
    
//     description: "Deep-fried dough balls soaked in syrup.",
//     price: 2.5,
//     imageUrl: "https://images.unsplash.com/photo-1656601447893-3c24954915c4",
//     ),
//     DessertModel(
//       id: '',
//         name: "Rice Pudding (Roz Bel Laban)",
    
//     description: "Creamy rice pudding flavored with cinnamon and vanilla.",
//     price: 2.0,
//     imageUrl: "https://images.unsplash.com/photo-1626082923194-83bcae6f56cb",
//     ),
//     DessertModel(
//       id: '',
//        name: "Cheesecake",
    
//     description: "Creamy dessert with a biscuit base, topped with fruit or chocolate.",
//     price: 6.0,
//     imageUrl: "https://images.unsplash.com/photo-1605475128023-4b21f2eabca5",
//     ),
//     DessertModel(
//       id: '',
//          name: "Tiramisu",
    
//     description: "Italian layered dessert with coffee-soaked biscuits and mascarpone.",
//     price: 5.5,
//     imageUrl: "https://images.unsplash.com/photo-1606813902777-5ecda3c09a77",
//     ),
//     DessertModel(
//       id: '',
//         name: "Brownie",
    
//     description: "Rich chocolate cake squares, fudgy or cakey.",
//     price: 3.2,
//     imageUrl: "https://images.unsplash.com/photo-1601979031441-62a7e6ef53f8",
//     ),
//   ];
// final collectionRef = firestore.collection('Dessert');
// for (var dessert in desserts) {
//   final existingDocs = await firestore
//       .collection('Dessert')
//       .where('name', isEqualTo: dessert.name)
//       .get();

//   if (existingDocs.docs.isEmpty) {
//     await firestore.collection('Dessert').add(dessert.toMap());
//   } else {
//     // هنا نعمل update
//     await existingDocs.docs.first.reference.update(dessert.toMap());
//   }
// }

  
// }

