

// import 'package:coffe_app/core/fireStore/Dessert/DesserReposatory.dart';
// import 'package:coffe_app/core/fireStore/Dessert/DessertModel.dart';

// import 'package:coffe_app/core/widgits/itemCard.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


// class Dessertscreen extends StatefulWidget {
//   final DessertReposatory dessertRepository =
//       DessertReposatory(firestore: FirebaseFirestore.instance);

//   Dessertscreen({super.key});

//   @override
//   State<Dessertscreen> createState() => _DessertscreenState();
// }

// class _DessertscreenState extends State<Dessertscreen> {
//   final TextEditingController _searchController = TextEditingController();
//   String searchQuery = "";

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(() {
//       setState(() {
//         searchQuery = _searchController.text.trim().toLowerCase();
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             // ✅ الجزء الثابت (Search + Menu)
//             Padding(
//               padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       controller: _searchController,
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey[100],
//                         border: InputBorder.none,
//                         hintText: 'Search',
//                         prefixIcon: const Icon(Icons.search),
//                         filled: true,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   const Icon(Icons.menu, size: 40, color: Colors.black),
//                 ],
//               ),
//             ),

//             // ✅ الـ GridView هو الوحيد اللي بيعمل Scroll
//             Expanded(
//               child: StreamBuilder<List<DessertModel>>(
//                 stream: widget.dessertRepository.getDesserts(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) {
//                     return const Center(child: Text("Error loading flowers"));
//                   }
//                   if (!snapshot.hasData) {
//                     return const Center(child: CircularProgressIndicator());
//                   }

//                   // كل القهوة
//                   final coffees = snapshot.data!;

//                   // فلترة بالبحث
//                   final filteredCoffees = coffees.where((coffee) {
//                     final name = coffee.name.toLowerCase();
//                     return name.contains(searchQuery);
//                   }).toList();

//                   if (filteredCoffees.isEmpty) {
//                     return const Center(child: Text("لا توجد نتائج مطابقة"));
//                   }

//                   return SingleChildScrollView(
//                     child: Column(
//                       children: [
                        
//                         const SizedBox(height: 10),
//                         const Text(
//                           "Recommended",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         GridView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           padding: const EdgeInsets.all(8),
//                           itemCount: filteredCoffees.length,
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             childAspectRatio: 0.7,
//                             crossAxisSpacing: 8,
//                             mainAxisSpacing: 8,
//                           ),
//                           itemBuilder: (context, index) {
//                             final coffee = filteredCoffees[index];
//                             return Itemcard(
//                               title: coffee.name,
//                               image: coffee.imageUrl,
//                               price: coffee.price,
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
