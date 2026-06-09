import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              recipe.image,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(recipe.description),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      const Icon(Icons.access_time),
                      const SizedBox(width: 6),
                      Text(recipe.time),

                      const SizedBox(width: 20),

                      const Icon(Icons.star),
                      const SizedBox(width: 6),
                      Text(recipe.rating),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "Ingredients",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Text(recipe.ingredients),

                  const SizedBox(height: 24),

                  const Text(
                    "Steps",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Text(recipe.steps),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
