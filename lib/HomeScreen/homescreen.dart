import '/HomeScreen/SearchScreen/settings.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '/HomeScreen/Drawer/drawer.dart';
import '/HomeScreen/Cart/cart.dart';
import '/HomeScreen/SearchScreen/search.dart';
import 'package:flutter/material.dart';
import 'HomePage/homepage.dart';
import '../providers/product_providers.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool checkStatus = false;
  int currentPageIndex = 0;
  final List<Widget> pagesList = [
    HomePage(),
    SearchScreen(),
    CartPage(),
    MyWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'basket.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.orange,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      drawer: MyDrawer(),
      //  body: pagesList[currentPageIndex],
      body: StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
          ConnectivityResult? results = snapshot.data;
          if (results == ConnectivityResult.mobile ||
              results == ConnectivityResult.wifi ||
              results == ConnectivityResult.vpn) {
            // Future.delayed(Duration.zero, () {
            //   Provider.of<Products>(context, listen: false).fetchProducts();
            // });
            // return pagesList[currentPageIndex];
            return FutureBuilder(
                future: Provider.of<Products>(context, listen: false)
                    .fetchProducts(),
                builder: (context, datasnap) {
                  if (datasnap.connectionState == ConnectionState.waiting &&
                      checkStatus == false) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    checkStatus = true;
                    return pagesList[currentPageIndex];
                  }
                });
          } else if (results == ConnectivityResult.none) {
            return const Center(
              child: Text('No internet Connection'),
            );
          } else {
            return const Center(child: Text('Checking Internet'));
          }
        },
      ),
    );
  }
}
