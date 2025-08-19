import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/Screens/BreadsScreen.dart';
import 'package:coffe_app/Screens/CoffeeScreen.dart';
import 'package:coffe_app/core/fireStore/BestSelling/BestSellingModel.dart';
import 'package:coffe_app/core/fireStore/BestSelling/BestSellingReposetory.dart';
import 'package:coffe_app/core/utils/textStyle.dart';
import 'package:coffe_app/core/widgits/itemCard.dart';
import 'package:coffe_app/core/widgits/smallContiner.dart';
import 'package:flutter/material.dart';

class CoffeeHomePage extends StatefulWidget {
  final Bestsellingreposetory coffeeRepository =
      Bestsellingreposetory(firestore: FirebaseFirestore.instance);

  CoffeeHomePage({super.key});

  @override
  State<CoffeeHomePage> createState() => _CoffeeHomePageState();
}

class _CoffeeHomePageState extends State<CoffeeHomePage> {
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
    final theme = Theme.of(context); // 👈 خد الثيم الحالي

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 16, right: 16, bottom: 20),
              child: Row(
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
                        hintStyle: theme.textTheme.bodyMedium
                            ?.copyWith(color: Colors.grey), // 
                        prefixIcon: Icon(Icons.search,
                            color: theme.iconTheme.color), // 
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.menu,
                      size: 40,
                      color: theme.iconTheme.color), // 
                ],
              ),
            ),

            // 📦 Body
            Expanded(
              child: StreamBuilder<List<BestsellingModel>>(
                stream: widget.coffeeRepository.getBestSelling(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                        child: Text("Error loading coffees",
                            style: theme.textTheme.bodyMedium));
                  }
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final coffees = snapshot.data!;
                  final filteredBestSellers = coffees.where((coffee) {
                    final name = coffee.name.toLowerCase();
                    return name.contains(searchQuery);
                  }).toList();

                  if (filteredBestSellers.isEmpty) {
                    return Center(
                        child: Text("No match result found",
                            style: theme.textTheme.bodyMedium));
                  }

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //  Categories Title
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Text(
                            'Categories',
                            style: AppStyles.heading(context),
                          ),
                        ),
                        const SizedBox(height: 10),

               
                        SizedBox(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              const SizedBox(width: 10),
                              Smallcontainer(
                                title: 'Coffee',
                                image: 'assets/coffeeCatagory.jpeg',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Coffeescreen()),
                                  );
                                },
                              ),
                              Smallcontainer(
                                title: 'Breads',
                                image: 'assets/beads.jpeg',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Breadsscreen()),
                                  );
                                },
                              ),
                              Smallcontainer(
                                title: 'Desserts',
                                image: 'assets/Dessert.jpeg',
                                onTap: () {},
                              ),
                              Smallcontainer(
                                title: 'Cold Drinks',
                                image: 'assets/coldDrinks.jpeg',
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),

                        //  Featured 
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Text(
                            'Featured Products',
                            style: AppStyles.heading(context),
                          ),
                        ),

                        //  Products Grid
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(8),
                          itemCount: filteredBestSellers.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemBuilder: (context, index) {
                            final coffee = filteredBestSellers[index];
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
