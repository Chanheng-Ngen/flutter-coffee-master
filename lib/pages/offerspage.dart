import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Offers(
          title: 'Special Discount',
          description: 'Get 20% off on all items this weekend!',
        ),
        Offers(
          title: 'Buy One Get One Free',
          description: 'Exclusive offer on selected products.',
        ),
        Offers(
          title: 'Free Shipping',
          description: 'Enjoy free shipping on orders over \$50.',
        ),
        Offers(
          title: 'Special Discount',
          description: 'Get 20% off on all items this weekend!',
        ),
        Offers(
          title: 'Buy One Get One Free',
          description: 'Exclusive offer on selected products.',
        ),
        Offers(
          title: 'Free Shipping',
          description: 'Enjoy free shipping on orders over \$50.',
        ),
      ],
    );
  }
}

class Offers extends StatelessWidget {
  // Properties
  final String title;
  final String description;

  const Offers({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 199,
      child: Card(
        elevation: 7,
        margin: const EdgeInsets.all(16),
        color: Colors.amberAccent,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Card(
                    color: Colors.white70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
