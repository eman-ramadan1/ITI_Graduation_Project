import 'package:coffe_app/core/fireStore/Breads/BreadsModel.dart';
import 'package:coffe_app/core/fireStore/Breads/BreadsReposatory.dart';
import 'package:coffe_app/core/widgits/itemCard.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Breadsscreen extends StatefulWidget {
  final Breadsreposatory breadRepository =
      Breadsreposatory(firestore: FirebaseFirestore.instance);

  Breadsscreen({super.key});

  @override
  State<Breadsscreen> createState() => _BreadsscreenState();
}

class _BreadsscreenState extends State<Breadsscreen> {
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


            // ✅ الـ GridView هو الوحيد اللي بيعمل Scroll
            Expanded(
              child: StreamBuilder<List<BreadsModel>>(
                stream: widget.breadRepository.getBreads(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text("Error loading flowers"));
                  }
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final breads = snapshot.data!;

                  // search filtering
                  final filteredBreads = breads.where((bread) {
                    final name = bread.name.toLowerCase();
                    return name.contains(searchQuery);
                  }).toList();

                  if (filteredBreads.isEmpty) {
                    return const Center(child: Text("No matching results found"));
                  }

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        
                        const SizedBox(height: 10),
                       
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(8),
                          itemCount: filteredBreads.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemBuilder: (context, index) {
                            final bread = filteredBreads[index];
                            return Itemcard(
                              title: bread.name,
                              image: bread.imageUrl,
                              price: bread.price,
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
