import 'package:coffe_master/datamanager.dart';
import 'package:flutter/material.dart';
import 'package:coffe_master/datamdel.dart';

class Menupage extends StatelessWidget {
  final Datamanager datamanager;

  const Menupage({super.key, required this.datamanager});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: datamanager.getMenu(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var categories = snapshot.data! as List<Category>;
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${categories[index].name}",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categories[index].products.length,
                    itemBuilder: (context, productIndex) {
                      return ProductItem(
                        product: categories[index].products[productIndex],
                        onAdd: (addProduct) {
                          datamanager.cardAdd(addProduct);
                        },
                      );
                    },
                  ),
                ],
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;

  const ProductItem({super.key, required this.product, required this.onAdd});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Card(
        color: Colors.brown.shade500,
        elevation: 8,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        product.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 24),
                      child: Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.brown.shade200,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      onAdd(product);
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
