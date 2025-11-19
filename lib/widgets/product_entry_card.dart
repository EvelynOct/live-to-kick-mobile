import 'package:flutter/material.dart';
import 'package:live_to_kick/models/product_entry.dart';

class ProductEntryCard extends StatelessWidget {
  final ProductEntry Product;
  final VoidCallback onTap;

  const ProductEntryCard({
    super.key,
    required this.Product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(Product.thumbnail)}',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 150,
                      color: Colors.grey[300],
                      child: const Center(child: Icon(Icons.broken_image)),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Title
                Text(
                  Product.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),

                // Category
                Text('Category: ${Product.category}'),
                const SizedBox(height: 6),

                // Content preview
                Text(
                  Product.content.length > 100
                      ? '${Product.content.substring(0, 100)}...'
                      : Product.content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 6),

                // Featured indicator
                if (Product.isFeatured)
                  const Text(
                    'Featured',
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}