import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/core/fireStore/BestSelling/BestSellingModel.dart';


Future<void> BestSellingSeed(FirebaseFirestore firestore) async {
  List<BestsellingModel> bestSellingItems = [
    BestsellingModel(
      id: '',
      name: "Donut",
    category: "sweet",
    description: "Buttery, flaky French pastry.",
    price: 2.5,
    imageUrl: "https://i.ibb.co/gL87KwHG/Donut.jpg", 
    ),
    BestsellingModel(
      id: '',
       name: "Iced Coffee",
    category: "sweet",
    description: "Soft roll with cinnamon sugar and icing.",
    price: 3.0,
    imageUrl: "https://i.ibb.co/gMXM6Sz0/Iced-Coffee.jpg",
    ),
    BestsellingModel(
      id: '',
       name: "Mini Pizza",
    category: "sweet",
    description: "Rich chocolate-flavored muffin.",
    price: 2.8,
    imageUrl: "https://i.ibb.co/nMsWZcJw/Mini-Pizza.jpg",
    ),
    BestsellingModel(
      id: '',
        name: "Mocha",
    category: "sweet",
    description: "Classic pie with apple filling.",
    price: 4.5,
    imageUrl: "https://i.ibb.co/fdJKhGC1/Mocha.jpg",),
   BestsellingModel(
      id: '',
       name: "Sausage Rolle",
    category: "sweet",
    description: "Soft cake topped with vanilla frosting.",
    price: 2.2,
    imageUrl: "https://i.ibb.co/zTK1Kqv3/Sausage-Roll.jpg",
    ),
    // BestsellingModel(
    //   id: '',
    //    name: "Baklava",
    // category: "sweet",
    // description: "Layers of filo pastry with nuts and honey.",
    // price: 3.5,
    // imageUrl: "https://images.unsplash.com/photo-1624353367001-7b6b26d3f1bb",
    // ),
    BestsellingModel(
      id: '',
       name: "Turkish Coffee",
    category: "sweet",
    description: "Small French butter cake with shell shape.",
    price: 2.0,
    imageUrl: "https://i.ibb.co/1tY4RsG3/Turkish-Coffee.jpg",
    ),
   
     
  ];
final collectionRef = firestore.collection('BestSelling');
for (var bestseller in bestSellingItems) {
  final existingDocs = await firestore
      .collection('BestSelling')
      .where('name', isEqualTo: bestseller.name)
      .get();

  if (existingDocs.docs.isEmpty) {
    await firestore.collection('BestSelling').add(bestseller.toMap());
  } else {
    // update
    await existingDocs.docs.first.reference.update(bestseller.toMap());
  }
}

  
}

