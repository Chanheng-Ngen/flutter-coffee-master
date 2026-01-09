import 'package:coffe_master/pages/menupage.dart';
import 'package:coffe_master/pages/offerspage.dart';
import 'package:coffe_master/pages/orderspage.dart';
import 'package:coffe_master/datamanager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Master',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Datamanager datamanager = Datamanager();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = const Text('.....');
    switch(selectedIndex){
      case 0: 
        currentWidgetPage = Menupage(datamanager: datamanager);
        break;
      case 1: 
        currentWidgetPage = const OffersPage();
        break;
      case 2: 
        currentWidgetPage = OrdersPage(datamanager: datamanager);
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/logo.png', height: 36, fit: BoxFit.contain,),
        backgroundColor: Colors.brown.shade500,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (newIndex){
          setState(() {
            selectedIndex = newIndex;
          });
        },
        backgroundColor: Colors.brown.shade500,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Offers',
          ),
          BottomNavigationBarItem(label: 'Orders', icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: currentWidgetPage,
    );
  }
}
