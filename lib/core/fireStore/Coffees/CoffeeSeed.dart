import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:coffe_app/core/fireStore/Coffees/CoffeeModel.dart';




Future<void> CoffeeSeed(FirebaseFirestore firestore) async {
  List<CoffeeModel> coffee = [
    CoffeeModel(
      id: '',
      name: 'Espresso Roast Beans',
      category: 'Business',
      price: 14.50,
      imageUrl: 'https://i.ibb.co/ZypjQkq/Espresso-Roast-Beans.png',
      
      description:
          'Teaches entrepreneurs how to launch startups successfully by using continuous innovation and validated learning.',
    ),
   CoffeeModel(
      id: '',
      name: "Espresso",
      category: "Hot Coffee",
      price: 30.0,
      imageUrl: "https://i.ibb.co/d40WXnts/Esspreso.jpg",
      description: "Strong concentrated coffee served in small shots."
    ),
    CoffeeModel(
      id: '',
      name: "Americano",
      category: "Hot Coffee",
      price: 28.0,
      imageUrl: "https://i.ibb.co/cSXg1nz7/Americano.jpg",
      description: "Espresso diluted with hot water for a smoother taste."
    ),
    CoffeeModel(
      id: '',
      name: "Latte",
      category: "Hot Coffee",
      price: 35.0,
      imageUrl: "https://i.ibb.co/9QmZLmb/Latte.jpg",
      description: "Espresso mixed with steamed milk and a light foam layer."
    ),
    CoffeeModel(
      id: '',
      name: "Cappuccino",
      category: "Hot Coffee",
      price: 35.0,
      imageUrl: "https://i.ibb.co/bR8bVyXJ/Cappuccino.jpg",
      description: "Espresso with equal parts of steamed milk and foam."
    ),
   
CoffeeModel(
      id: '',
       name: "Macchiato",
    category: "Hot Coffee",
    price: 32.0,
     imageUrl: "https://i.ibb.co/hJf6XBrP/Macchiato.jpg",
    description: "Espresso marked with a small amount of milk."
    ),
    CoffeeModel(
      id: '',
      name: "Mocha",
      category: "Hot Coffee",
      price: 38.0,
      imageUrl: "https://i.ibb.co/fdJKhGC1/Mocha.jpg",
      description: "A latte flavored with chocolate syrup."
    ),
    CoffeeModel(
      id: '',
      name: "Cold Brew",
      category: "Cold Coffee",
      price: 40.0,
      imageUrl: "https://i.ibb.co/G4Kt97xt/Cold-Brew.jpg",
      description: "Coffee steeped in cold water for 12+ hours."
    ),
    CoffeeModel(
      id: '',
      name: "Iced Coffee",
      category: "Cold Coffee",
      price: 33.0,
      imageUrl: "https://i.ibb.co/gMXM6Sz0/Iced-Coffee.jpg",
      description: "Freshly brewed coffee served over ice."
    ),
    CoffeeModel(
      id: '',
      name: "Turkish Coffee",
      category: "Traditional Coffee",
      price: 25.0,
      imageUrl: "https://i.ibb.co/1tY4RsG3/Turkish-Coffee.jpg",
      description: "Strong finely ground coffee simmered in a cezve."
    ),
    CoffeeModel(
      id: '',
      name: "French Coffee",
      category: "Brewed Coffee",
      price: 30.0,
      imageUrl: "https://i.ibb.co/RTr2ZjwP/French-Press-Coffee.jpg",
      description: "Coarsely ground coffee steeped and pressed in a French press."
    ),



  ];
final collectionRef = firestore.collection('Coffee');
for (var coffee in coffee) {
  final existingDocs = await firestore
      .collection('Coffee')
      .where('name', isEqualTo: coffee.name)
      .get();

  if (existingDocs.docs.isEmpty) {
    await firestore.collection('Coffee').add(coffee.toMap());
  } else {
    // هنا نعمل update
    await existingDocs.docs.first.reference.update(coffee.toMap());
  }
}

  
}

