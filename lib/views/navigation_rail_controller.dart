import 'package:ecommerce_admin/views/nav_pages/orders.dart';
import 'package:ecommerce_admin/views/nav_pages/products.dart';
import 'package:ecommerce_admin/views/nav_pages/users.dart';
import 'package:flutter/material.dart';

class NavigationRailController extends StatefulWidget {
  const NavigationRailController({super.key});

  @override
  State<NavigationRailController> createState() =>
      _NavigationRailControllerState();
}

class _NavigationRailControllerState extends State<NavigationRailController> {
  int _selectedIndex = 0;
  List currentScreen = [
    Orders(),
    Products(),
    Users(),
  ];

  logout() {
    showDialog(
        context: context,
        builder: (_) => Dialog(
              child: Container(
                height: 150,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text('Are you sure to logout?'),
                      Divider(),
                      Row(
                        children: [
                          TextButton(onPressed: () {}, child: Text('Yes')),
                          SizedBox(
                            width: 10,
                          ),
                          TextButton(onPressed: () {}, child: Text('No')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color(0xFFFCFCFC),
        title: Text(
          "App Admin",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => logout(),
            icon: Icon(
              Icons.logout_outlined,
            ),
          )
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            groupAlignment: 0.0,
            elevation: 5,
            minWidth: 120,
            // extended: true,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              // navigation destinations
              NavigationRailDestination(
                icon: Icon(Icons.shopping_basket_outlined),
                label: Text('Orders'),
              ),

              NavigationRailDestination(
                icon: Icon(Icons.shop_2_outlined),
                label: Text('Products'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person_outline_rounded),
                label: Text('Users'),
              ),
            ],
            selectedIconTheme: const IconThemeData(color: Colors.black),
            unselectedIconTheme: const IconThemeData(color: Colors.black54),
            selectedLabelTextStyle: const TextStyle(color: Colors.black),
            unselectedLabelTextStyle: const TextStyle(color: Colors.black54),
          ),
          Expanded(child: currentScreen[_selectedIndex])
        ],
      ),
    );
  }
}
