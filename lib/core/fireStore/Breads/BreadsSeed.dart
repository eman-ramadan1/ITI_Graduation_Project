import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/core/fireStore/Breads/BreadsModel.dart';



Future<void> BreadsSeed(FirebaseFirestore firestore) async {
  List<BreadsModel> breads = [
    BreadsModel(
      id: '',
      name: "Croissant",
    category: "sweet",
    description: "Buttery, flaky French pastry.",
    price: 2.5,
    imageUrl: "https://i.ibb.co/jZJTVh5c/Croissant.jpg", 
    ),
    BreadsModel(
      id: '',
       name: "Cinnamon Roll",
    category: "sweet",
    description: "Soft roll with cinnamon sugar and icing.",
    price: 3.0,
    imageUrl: "https://i.ibb.co/DfT6rnn9/Cinnamon-Roll.jpg",
    ),
    BreadsModel(
      id: '',
       name: "Chocolate Muffin",
    category: "sweet",
    description: "Rich chocolate-flavored muffin.",
    price: 2.8,
    imageUrl: "https://i.ibb.co/JRdzcPBw/Chocolate-Muffin.jpg",
    ),
    BreadsModel(
      id: '',
        name: "Apple Pie",
    category: "sweet",
    description: "Classic pie with apple filling.",
    price: 4.5,
    imageUrl: "https://i.ibb.co/FkZc3P4W/ApplePie.jpg",
    ),
    BreadsModel(
      id: '',
       name: "Vanilla Cupcake",
    category: "sweet",
    description: "Soft cake topped with vanilla frosting.",
    price: 2.2,
    imageUrl: "https://i.ibb.co/ZzP86X6B/Vanilla-Cupcake.jpg",
    ),
    BreadsModel(
      id: '',
       name: "Baklava",
    category: "sweet",
    description: "Layers of filo pastry with nuts and honey.",
    price: 3.5,
    imageUrl: "https://i.ibb.co/V0kdRg5j/Baklava.jpg",
    ),
    BreadsModel(
      id: '',
       name: "Madeleine",
    category: "sweet",
    description: "Small French butter cake with shell shape.",
    price: 2.0,
    imageUrl: "https://images.unsplash.com/photo-1517685352821-92cf88aee5a5",
    ),
    BreadsModel(
      id: '',
        name: "Donut",
    category: "sweet",
    description: "Fried dough ring with sugar or glaze.",
    price: 1.8,
    imageUrl: "https://i.ibb.co/DfT6rnn9/Cinnamon-Roll.jpg",
    ),
    BreadsModel(
      id: '',
        name: "Cheese Scone",
    category: "savory",
    description: "Fluffy scone with cheese flavor.",
    price: 2.3,
    imageUrl: "https://i.ibb.co/RpwHJXLN/Cheese-Scone.jpg",
    ),
    BreadsModel(
      id: '',
        name: "Garlic Bread",
    category: "savory",
    description: "Bread topped with garlic and butter.",
    price: 2.7,
    imageUrl: "https://i.ibb.co/fV1bszhP/Garlic-Bread.jpg",
    ),
    BreadsModel(
      id: '',
         name: "Spinach Pie",
    category: "savory",
    description: "Pie filled with spinach and cheese.",
    price: 3.8,
    imageUrl: "https://i.ibb.co/Xkbjrg0h/Spinach-Pie.jpg",
    ),
    BreadsModel(
      id: '',
        name: "Focaccia",
    category: "savory",
    description: "Italian flatbread with olive oil and herbs.",
    price: 3.0,
    imageUrl: "https://i.ibb.co/Kc6ZFkdr/Focaccia.jpg",
    ),
    BreadsModel(
      id: '',
       name: "Sausage Roll",
    category: "savory",
    description: "Puff pastry wrapped around sausage meat.",
    price: 3.2,
    imageUrl: "https://i.ibb.co/zTK1Kqv3/Sausage-Roll.jpg",
    ),
    BreadsModel(
      id: '',
         name: "Empanada",
    category: "savory",
    description: "Pastry stuffed with meat or vegetables.",
    price: 3.5,
    imageUrl: "https://i.ibb.co/F4h66Ms7/Empanada.jpg",
    ),
    BreadsModel(
      id: '',
         name: "Mini Pizza",
    category: "savory",
    description: "Small pizza with cheese and toppings.",
    price: 4.0,
    imageUrl: "https://i.ibb.co/nMsWZcJw/Mini-Pizza.jpg",
    ),
    BreadsModel(
      id: '',
         name: "Empanadaa",
    category: "savory",
    description: "Pastry stuffed with meat or vegetables.",
    price: 3.5,
    imageUrl: "https://i.ibb.co/SwjM7tFD/Empanadaa.png",
    ),
  ];
final collectionRef = firestore.collection('Breads');
for (var bread in breads) {
  final existingDocs = await firestore
      .collection('Breads')
      .where('name', isEqualTo: bread.name)
      .get();

  if (existingDocs.docs.isEmpty) {
    await firestore.collection('Breads').add(bread.toMap());
  } else {
    // هنا نعمل update
    await existingDocs.docs.first.reference.update(bread.toMap());
  }
}

  
}

