import 'package:coffe_app/core/fireStore/Coffees/CoffeeReposetory.dart';
import 'package:coffe_app/core/fireStore/Coffees/CoffeeModel.dart';
import 'package:coffe_app/core/utils/textStyle.dart';

import 'package:coffe_app/core/widgits/itemCard.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Coffeescreen extends StatefulWidget {
  final CoffeeRepository coffeeRepository = CoffeeRepository(
    firestore: FirebaseFirestore.instance,
  );

  Coffeescreen({super.key});

  @override
  State<Coffeescreen> createState() => _CoffeescreenState();
}

class _CoffeescreenState extends State<Coffeescreen> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        searchQuery = _searchController.text.trim().toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 16,
                right: 16,
                bottom: 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _searchController,
                          style: theme.textTheme.bodyMedium,
                          decoration: InputDecoration(
                            fillColor: theme.cardColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Search',
                            hintStyle: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.grey,
                            ), //
                            prefixIcon: Icon(
                              Icons.search,
                              color: theme.iconTheme.color,
                            ), //
                            filled: true,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.menu, size: 40, color: theme.iconTheme.color), //
                    ],
                  ),
                  Divider(thickness: 1,),
                  // SizedBox(height: 8,),
                ],
              ),
            ),
           
            // const SizedBox(height: 8,),

            Expanded(
              child: StreamBuilder<List<CoffeeModel>>(
                stream: widget.coffeeRepository.getCoffee(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text("Error loading flowers"));
                  }
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final coffees = snapshot.data!;

                  // search filtering
                  final filteredCoffees = coffees.where((coffee) {
                    final name = coffee.name.toLowerCase();
                    return name.contains(searchQuery);
                  }).toList();

                  if (filteredCoffees.isEmpty) {
                    return const Center(
                      child: Text("No matching results found"),
                    );
                  }

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(8),
                          itemCount: filteredCoffees.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.7,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                              ),
                          itemBuilder: (context, index) {
                            final coffee = filteredCoffees[index];
                            return Itemcard(
                              title: coffee.name,
                              image: coffee.imageUrl,
                              price: coffee.price,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
