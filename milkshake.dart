import 'package:flutter/material.dart';

void main() {
  runApp(const MilkshakeApp());
}

class MilkshakeApp extends StatelessWidget {
  const MilkshakeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MilkshakePage(),
    );
  }
}

class MilkshakePage extends StatelessWidget {
  const MilkshakePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 147, 222),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// GAMBAR
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "milkshake.jpg",
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 25),

              /// JUDUL
              const Text(
                "Time for a milkshake break....",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              /// DESKRIPSI
              const Text(
                "Your daily dose of fresh milk delivered to your doorstep. Start your milkshake journey now!",
                style: TextStyle(color: Colors.white70, fontSize: 14),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              /// DOT SLIDER
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [dot(true), dot(false), dot(false), dot(false)],
              ),

              const SizedBox(height: 25),

              /// BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MenuPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffF48A2A),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget dot(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 18 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String selectedCategory = "Chocolate";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// SEARCH BAR
              TextField(
                decoration: InputDecoration(
                  hintText: "Search milkshake",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// KATEGORI
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = "Chocolate";
                      });
                    },
                    child: CategoryItem(
                      "Chocolate",
                      selectedCategory == "Chocolate",
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = "Strawberry";
                      });
                    },
                    child: CategoryItem(
                      "Strawberry",
                      selectedCategory == "Strawberry",
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = "Vanilla";
                      });
                    },
                    child: CategoryItem(
                      "Vanilla",
                      selectedCategory == "Vanilla",
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = "Blueberry";
                      });
                    },
                    child: CategoryItem(
                      "Blueberry",
                      selectedCategory == "Blueberry",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// LIST MENU
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: selectedCategory == "Chocolate"
                      ? [
                          menuCard(
                            context,
                            "Original Chocolate Milkshake",
                            "4.5",
                            "4.20",
                            "Choco1.jpg",
                          ),
                          menuCard(
                            context,
                            "Special Chocolate Milkshake",
                            "4.8",
                            "4.55",
                            "Choco.jpg",
                          ),
                          menuCard(
                            context,
                            "Chocolate Oreo Milkshake",
                            "4.6",
                            "4.70",
                            "Choco2.jpg",
                          ),
                          menuCard(
                            context,
                            "Double Chocolate Milkshake",
                            "4.7",
                            "4.90",
                            "Choco3.jpg",
                          ),
                        ]
                      : selectedCategory == "Strawberry"
                      ? [
                          menuCard(
                            context,
                            "Original Strawberry Milkshake",
                            "4.4",
                            "3.99",
                            "Strawberry.jpg",
                          ),
                          menuCard(
                            context,
                            "Strawberry Yoghurt Milkshake",
                            "4.9",
                            "4.90",
                            "Strawberry1.jpg",
                          ),
                          menuCard(
                            context,
                            "Strawberry Cheesecake Milkshake",
                            "4.6",
                            "4.70",
                            "Strawberry2.jpg",
                          ),
                          menuCard(
                            context,
                            "Special Strawberry Milkshake",
                            "4.8",
                            "4.55",
                            "Strawberry3.jpg",
                          ),
                        ]
                      : selectedCategory == "Vanilla"
                      ? [
                          menuCard(
                            context,
                            "Vanilla Biscuit Milkshake",
                            "4.4",
                            "4.50",
                            "Vanilla.jpg",
                          ),
                          menuCard(
                            context,
                            "Vanilla Caramel Milkshake",
                            "4.9",
                            "4.40",
                            "Vanilla1.jpg",
                          ),
                          menuCard(
                            context,
                            "Original Vanilla Milkshake",
                            "4.6",
                            "3.80",
                            "Vanilla2.jpg",
                          ),
                          menuCard(
                            context,
                            "Special Vanilla Milkshake",
                            "4.7",
                            "4.55",
                            "Vanilla3.jpg",
                          ),
                        ]
                      : [
                          menuCard(
                            context,
                            "Original Blueberry Milkshake",
                            "4.5",
                            "4.00",
                            "Blueberry1.jpg",
                          ),
                          menuCard(
                            context,
                            "Blueberry Cheesecake Milkshake",
                            "4.5",
                            "4.47",
                            "Blueberry.jpg",
                          ),
                          menuCard(
                            context,
                            "Blueberry Yoghurt Milkshake",
                            "4.6",
                            "4.70",
                            "Blueberry2.jpg",
                          ),
                          menuCard(
                            context,
                            "Special Blueberry Milkshake",
                            "4.7",
                            "4.55",
                            "Blueberry3.jpg",
                          ),
                        ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuCard(
    BuildContext context,
    String title,
    String rating,
    String price,
    String image,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailPage(title: title, price: price, image: image),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 147, 222),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(child: Image.asset(image, fit: BoxFit.contain)),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("⭐ $rating", style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 5),
            Text("\$$price", style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

/// KATEGORI
class CategoryItem extends StatelessWidget {
  final String title;
  final bool active;

  const CategoryItem(this.title, this.active, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: active ? const Color(0xffF48A2A) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(color: active ? Colors.white : Colors.black),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  const DetailPage({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: SafeArea(
        child: Column(
          children: [
            /// BACK BUTTON
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            /// 🔥 GAMBAR (INI BAGIAN UTAMA)
            Image.asset(image, height: 180),

            const SizedBox(height: 20),

            /// TITLE
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Delicious creamy milkshake with fresh ingredients.",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            /// SIZE
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                sizeButton("S"),
                sizeButton("M", active: true),
                sizeButton("L"),
              ],
            ),

            const Spacer(),

            /// PRICE + BUTTON
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$$price",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF48A2A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("Buy Now"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// SIZE BUTTON
  Widget sizeButton(String size, {bool active = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: active ? const Color(0xffF48A2A) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        size,
        style: TextStyle(color: active ? Colors.white : Colors.black),
      ),
    );
  }
}
