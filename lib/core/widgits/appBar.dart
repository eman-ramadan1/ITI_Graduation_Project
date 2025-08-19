import 'package:coffe_app/core/utils/textStyle.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = "";
  AppBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.fromLTRB(1, 60, 1, 5),
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
        ],
      ),
    );
  }
}
