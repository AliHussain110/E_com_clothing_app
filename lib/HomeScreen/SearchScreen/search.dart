import 'package:clothes_app/HomeScreen/HomePage/productpage.dart';

import '/HomeScreen/HomePage/Components/productlist.dart';
import '/providers/product_providers.dart';
import '/providers/category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final textfieldController = TextEditingController();
  bool filterValue = false;
  var filterList;

  @override
  Widget build(BuildContext context) {
    final searchFilter = Provider.of<Products>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 50,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: Material(
            elevation: 18,
            shadowColor: Colors.black,
            child: TextField(
              onChanged: (_) {
                String data = textfieldController.text;
                filterList = searchFilter.searchFilter(data);
                if (filterList.isNotEmpty && data != '') {
                  setState(() {
                    filterValue = true;
                  });
                } else {
                  setState(() {
                    filterValue = false;
                    print(data);
                  });
                }
              },
              onSubmitted: (_) {
                String data = textfieldController.text;
                filterList = searchFilter.searchFilter(data);
                if (filterList.isNotEmpty) {
                  setState(() {
                    filterValue = true;
                  });
                } else {
                  setState(() {
                    filterValue = false;
                  });
                }
              },
              controller: textfieldController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'What are u looking for?',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        filterValue
            ? Expanded(
                child: GridView.builder(
                    itemCount: filterList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height),
                      crossAxisSpacing: 2.4,
                      mainAxisSpacing: 2.5,
                    ),
                    itemBuilder: (context, i) {
                      return ProductPageList(
                        filterList[i].id,
                        filterList[i].title,
                        filterList[i].price,
                        filterList[i].imageUrl.keys.single,
                        filterList[i].discription,
                      );
                    }),
              )
            : CategoryWidget(),
      ],
    );
  }
}

class CategoryWidget extends StatefulWidget {
  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final catObject = Provider.of<CategoryItem>(context).item;

    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.all(5),
          // color: Colors.red,
          // padding: const EdgeInsets.all(2),
          height: 50,
          // color: Colors.black,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: catObject.length,
            itemBuilder: (context, i) => Column(
              children: [
                SizedBox(
                  height: 35,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = i;
                        });
                      },
                      child: Text(
                        catObject[i].name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                // SizedBox(
                //   height: 5,
                // ),
                Container(
                  // margin: const EdgeInsets.only(
                  //   top: 2,
                  // ),
                  height: 2,
                  width: 25,
                  color: selectedIndex == i ? Colors.red : Colors.white,
                ),
              ],
            ),
          ),
        ),
        CardsWidget(),
      ],
    );
  }
}

class CardsWidget extends StatelessWidget {
  final List<String> categorySearch = [
    'shoes',
    'clothes',
    'jacket',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.3,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ExpansionTile(
            collapsedShape: const RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            shape: const RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            title: Text(
              categorySearch[index],
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            children: [
              NewCategoryWidget(
                categorySearch[index],
              )
            ],
          );
        },
        itemCount: categorySearch.length,
      ),
    );
  }
}

class NewCategoryWidget extends StatelessWidget {
  final String filterVariable;
  NewCategoryWidget(this.filterVariable);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).fliterItem(filterVariable);

    return Container(
      // color: Colors.amber,
      // padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 10),
      height: 300,
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) {
          final price = products[i].price;
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                ProductScreen.routeName,
                arguments: products[i].id,
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: products[i].id,
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    height: 250,
                    width: 200,
                    child: FadeInImage(
                      placeholder: AssetImage('assets/img10.jpg'),
                      image: NetworkImage(
                        products[i].imageUrl.keys.single,
                      ),
                      fit: BoxFit.cover,
                    ),
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(
                    //     image: AssetImage(),
                    //   ),
                    // ),
                    // child: Text(products[i].title),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$$price",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        products[i].title,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
