import 'package:flutter/material.dart';

class Itemcard extends StatelessWidget {
  const Itemcard({
    super.key,
    required this.title,
    required this.image,
    required this.price,
  });

  final String title;
  final String image;
  final double price;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: 171,
      height: 400,
      child: Card(
        color: theme.cardColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Image.network(
                image,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),

            // Title
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 5),

            // Price
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // Add to Cart Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 6,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                // backgroundColor: theme.colorScheme.primary,
                // foregroundColor: theme.colorScheme.onPrimary,
              ),
              onPressed: () {},
              child: const Text(
                'Add to Cart',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
