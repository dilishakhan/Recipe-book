import 'package:flutter/material.dart';
import '../data/recipe_data.dart';
import '../widgets/recipe_card.dart';
// ignore: unused_import
import '../models/recipe.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  Widget buildCategory(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade400, Colors.deepOrange.shade400],
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withValues(alpha: 0.25),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange.shade300,
                        Colors.deepOrange.shade400,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Text(
                    "RECIPE BOOK",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Container(
                height: 62,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.orange),
                    SizedBox(width: 12),
                    Text("Search recipes..."),
                    Spacer(),
                    Icon(Icons.tune),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                "Categories",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 18),

              SizedBox(
                height: 58,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCategory("🍰 Sweets"),
                    buildCategory("☕ Coffee"),
                    buildCategory("🍕 Pizza"),
                    buildCategory("🍔 Burger"),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                "Popular Recipes",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    return RecipeCard(recipe: recipes[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
