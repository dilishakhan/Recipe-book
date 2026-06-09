/*import 'package:flutter/material.dart';
import 'screens/recipe_list_screen.dart';

void main() {
  runApp(const RecipeBookApp());
}

class RecipeBookApp extends StatelessWidget {
  const RecipeBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Book',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF8F3),
        fontFamily: 'Roboto',
      ),
      home: const RecipeListScreen(),
    );
  }
}
*/
import 'package:flutter/material.dart';

void main() {
  runApp(const RecipeBookApp());
}

class RecipeBookApp extends StatelessWidget {
  const RecipeBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Book',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF8F3),
        fontFamily: 'Roboto',
      ),
      home: const RecipeListScreen(),
    );
  }
}

/// ======================
/// RECIPE MODEL
/// ======================

class Recipe {
  final String name;
  final String image;
  final String description;
  final String time;
  final String rating;
  final String ingredients;
  final String steps;

  Recipe({
    required this.name,
    required this.image,
    required this.description,
    required this.time,
    required this.rating,
    required this.ingredients,
    required this.steps,
  });
}

/// ======================
/// RECIPE DATA
/// ======================

final List<Recipe> recipes = [
  Recipe(
    name: "Creamy Pasta",
    image: "https://images.unsplash.com/photo-1645112411341-6c4fd023714a",
    description: "A rich and creamy pasta with garlic and cheese.",
    time: "25 min",
    rating: "4.8",
    ingredients: "• Pasta\n• Garlic\n• Cheese\n• Cream\n• Butter",
    steps:
        "1. Boil the pasta.\n\n"
        "2. Cook garlic in butter.\n\n"
        "3. Add cream and cheese.\n\n"
        "4. Mix with pasta.\n\n"
        "5. Serve hot.",
  ),

  Recipe(
    name: "Veg Burger",
    image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
    description: "Delicious veg burger with fresh veggies.",
    time: "20 min",
    rating: "4.6",
    ingredients: "• Burger Bun\n• Veg Patty\n• Lettuce\n• Tomato\n• Cheese",
    steps:
        "1. Toast the buns.\n\n"
        "2. Cook the patty.\n\n"
        "3. Add veggies and cheese.\n\n"
        "4. Assemble burger.\n\n"
        "5. Serve fresh.",
  ),

  Recipe(
    name: "Chocolate Cake",
    image: "https://images.unsplash.com/photo-1578985545062-69928b1d9587",
    description: "Moist chocolate cake topped with ganache.",
    time: "45 min",
    rating: "4.9",
    ingredients: "• Flour\n• Cocoa Powder\n• Eggs\n• Sugar\n• Chocolate",
    steps:
        "1. Prepare cake batter.\n\n"
        "2. Bake at 180°C.\n\n"
        "3. Cool the cake.\n\n"
        "4. Add chocolate ganache.\n\n"
        "5. Decorate and serve.",
  ),

  Recipe(
    name: "Pizza",
    image: "https://images.unsplash.com/photo-1513104890138-7c749659a591",
    description: "Cheesy pizza loaded with toppings.",
    time: "30 min",
    rating: "4.7",
    ingredients: "• Pizza Base\n• Cheese\n• Sauce\n• Veggies",
    steps:
        "1. Spread sauce on base.\n\n"
        "2. Add toppings.\n\n"
        "3. Add cheese generously.\n\n"
        "4. Bake until crispy.\n\n"
        "5. Slice and enjoy.",
  ),

  Recipe(
    name: "Cold Coffee",
    image: "https://images.unsplash.com/photo-1517701604599-bb29b565090c",
    description: "Refreshing cold coffee for your day.",
    time: "10 min",
    rating: "4.8",
    ingredients: "• Coffee\n• Milk\n• Sugar\n• Ice Cubes",
    steps:
        "1. Add coffee and sugar.\n\n"
        "2. Pour chilled milk.\n\n"
        "3. Blend properly.\n\n"
        "4. Add ice cubes.\n\n"
        "5. Serve chilled.",
  ),

  Recipe(
    name: "Fried Rice",
    image: "https://images.unsplash.com/photo-1603133872878-684f208fb84b",
    description: "Flavorful fried rice with veggies.",
    time: "22 min",
    rating: "4.7",
    ingredients: "• Rice\n• Vegetables\n• Soy Sauce\n• Garlic",
    steps:
        "1. Cook vegetables.\n\n"
        "2. Add boiled rice.\n\n"
        "3. Mix sauces.\n\n"
        "4. Stir fry well.\n\n"
        "5. Serve hot.",
  ),
];

/// ======================
/// HOME PAGE
/// ======================

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  /// CATEGORY UI
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
            color: Colors.orange.withOpacity(0.25),
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

  /// RECIPE CARD
  Widget buildRecipeCard(BuildContext context, Recipe recipe) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailScreen(recipe: recipe),
          ),
        );
      },

      child: Container(
        height: 150,
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: Row(
          children: [
            /// IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.network(
                recipe.image,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 16),

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    recipe.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    recipe.description,
                    style: const TextStyle(color: Colors.black87, fontSize: 15),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      /// TIME
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF3E7),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.orange.shade700,
                              size: 16,
                            ),

                            const SizedBox(width: 6),

                            Text(
                              recipe.time,
                              style: TextStyle(
                                color: Colors.orange.shade700,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),

                      /// RATING
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF3E7),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange.shade700,
                              size: 16,
                            ),

                            const SizedBox(width: 6),

                            Text(
                              recipe.rating,
                              style: TextStyle(
                                color: Colors.orange.shade700,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// ARROW
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange.shade400, Colors.deepOrange.shade400],
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_forward, color: Colors.white),
            ),
          ],
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

              /// HEADING
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
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// SEARCH BAR
              Container(
                height: 62,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),

                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.orange.shade700),

                    const SizedBox(width: 12),

                    const Text(
                      "Search recipes...",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),

                    const Spacer(),

                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3E7),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(Icons.tune, color: Colors.orange.shade700),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              /// CATEGORIES
              const Text(
                "Categories",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
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
                    buildCategory("🍝 Pasta"),
                    buildCategory("🍛 Main Course"),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              /// POPULAR RECIPES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular Recipes",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "See All",
                    style: TextStyle(
                      color: Colors.orange.shade700,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// LIST
              Expanded(
                child: ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    return buildRecipeCard(context, recipes[index]);
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

/// ======================
/// DETAIL PAGE
/// ======================

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F3),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            /// IMAGE
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),

                  child: Image.network(
                    recipe.image,
                    height: 320,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 50,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },

                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(22),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  /// TITLE
                  Text(
                    recipe.name,
                    style: const TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// TIME & RATING
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF3E7),
                          borderRadius: BorderRadius.circular(14),
                        ),

                        child: Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.orange.shade700,
                            ),

                            const SizedBox(width: 6),

                            Text(
                              recipe.time,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 12),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF3E7),
                          borderRadius: BorderRadius.circular(14),
                        ),

                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange.shade700),

                            const SizedBox(width: 6),

                            Text(
                              recipe.rating,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  /// DESCRIPTION
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    recipe.description,
                    style: const TextStyle(fontSize: 18, height: 1.6),
                  ),

                  const SizedBox(height: 30),

                  /// INGREDIENTS
                  const Text(
                    "Ingredients",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),

                    child: Text(
                      recipe.ingredients,
                      style: const TextStyle(fontSize: 18, height: 1.7),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// STEPS
                  const Text(
                    "Instructions",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),

                    child: Text(
                      recipe.steps,
                      style: const TextStyle(fontSize: 18, height: 1.8),
                    ),
                  ),

                  const SizedBox(height: 34),

                  /// BUTTON
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 18),

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange.shade400,
                          Colors.deepOrange.shade400,
                        ],
                      ),

                      borderRadius: BorderRadius.circular(24),
                    ),

                    child: const Center(
                      child: Text(
                        "Start Cooking 🍳",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
