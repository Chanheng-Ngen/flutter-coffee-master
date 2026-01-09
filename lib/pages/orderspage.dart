import 'package:coffe_master/datamanager.dart';
import 'package:coffe_master/datamdel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OrdersPage extends StatefulWidget {
  Datamanager datamanager;
  OrdersPage({super.key, required this.datamanager});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.datamanager.cart.isEmpty) {
      return const Center(
        child: Text(
          'Your cart is empty.',
          style: TextStyle(fontSize: 20, color: Colors.brown),
        ),
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.datamanager.cart.length,
              itemBuilder: (context, index) {
                var item = widget.datamanager.cart[index];
                return OrderItem(
                  item: item,
                  onRemove: (product) {
                    setState(() {
                      widget.datamanager.cardDelete(product);
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const OrderAlert(),
                );
                setState(() {
                  widget.datamanager.cartClear();
                });
              },
              child: const Text('Send Order', style: TextStyle(color: Colors.brown),),
            ),
          ),
        ],
      );
    }
  }
}

class OrderItem extends StatelessWidget {
  final ItemInCart item;
  final Function onRemove;
  const OrderItem({super.key, required this.item, required this.onRemove});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${item.quantity}x"),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.product.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "\$" + (item.product.price * item.quantity).toStringAsFixed(2),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  onRemove(item.product);
                },
                icon: const Icon(Icons.delete, color: Colors.brown),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderAlert extends StatelessWidget {
  const OrderAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Your Order"),
      content: const Text("Your order is being prepared. Thanks!"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK', style: TextStyle(color: Colors.brown),),
        ),
      ],
    );
  }
}
