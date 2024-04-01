import '/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// String p1 =
//     'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSDwHzWEXSPQeUySAnoWsGxr-fWKADCP8-wxKjfzbZw4rEtKnhl';
// String p2 =
//     'https://images.unsplash.com/photo-1622445275463-afa2ab738c34?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHRzaGlydHxlbnwwfHwwfHx8MA%3D%3D';
// String p3 =
//     'https://images.unsplash.com/photo-1622445275463-afa2ab738c34?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHRzaGlydHxlbnwwfHwwfHx8MA%3D%3D';
// String p4 =
//     'https://plus.unsplash.com/premium_photo-1682342786341-239a41287013?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHRzaGlydHxlbnwwfHwwfHx8MA%3D%3D';

// String p5 =
//     'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D';

// String p6 =
//     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmyOmykYz1_khFBCIgTtcufxPsh4bYQ69pdQ&usqp=CAU';
// String p7 =
//     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgUPawRRq3TCrG5o6IznRkp349zadpZvsSVA&usqp=CAU';
// String p8 =
//     'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D';
// String p9 =
//     'https://images.unsplash.com/photo-1544022613-e87ca75a784a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8amFja2V0fGVufDB8fDB8fHww';

// String p10 =
//     'https://images.unsplash.com/photo-1548883354-94bcfe321cbb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGphY2tldHxlbnwwfHwwfHx8MA%3D%3D';

class Products with ChangeNotifier {
  List<Product> _item = [
    // Product(
    //   id: 'p1',
    //   price: 299.99,
    //   imageUrl: {
    //     p1: [
    //       p1,
    //       p1,
    //       p1,
    //       p1,
    //       p1,
    //     ],
    //   },
    //   title: 'Heavy cotton t-shirt',
    //   discription: 'data about t-shit',
    //   type: 'clothes',
    //   isFav: false,
    // ),
    // Product(
    //   id: 'p2',
    //   price: 99.99,
    //   imageUrl: {
    //     p2: [
    //       p2,
    //       p2,
    //       p2,
    //       p2,
    //     ],
    //   },
    //   title: 'Leather Jacket',
    //   discription: 'data about leather jacket',
    //   type: 'clothes',
    //   isFav: false,
    // ),
    // Product(
    //   id: 'p3',
    //   price: 29.99,
    //   imageUrl: {
    //     p3: [p3, p3, p3, p3],
    //   },
    //   title: 'Heavy cotton t-shirt',
    //   discription: 'Data about t-shirt',
    //   type: 'clothes',
    //   isFav: false,
    // ),
    // Product(
    //   id: 'p4',
    //   price: 199.99,
    //   imageUrl: {
    //     p4: [p4, p4, p4, p4, p4],
    //   },
    //   title: 'Heavy cotton t-shirt',
    //   discription: 'Data about leather jackets',
    //   type: 'clothes',
    //   isFav: false,
    // ),
    // Product(
    //   id: 'p5',
    //   price: 99.99,
    //   imageUrl: {
    //     p5: [p5, p5, p5, p5],
    //   },
    //   title: 'White sneakers',
    //   discription: 'Data about sneaker',
    //   type: 'shoes',
    //   isFav: false,
    // ),
    // Product(
    //   id: 'p6',
    //   price: 79.99,
    //   imageUrl: {
    //     p6: [p6, p6, p6, p6],
    //   },
    //   title: 'Dark sneakers',
    //   discription: 'Data about sneaker',
    //   type: 'shoes',
    //   isFav: false,
    // ),
    // Product(
    //   id: 'p7',
    //   price: 99.99,
    //   imageUrl: {
    //     p7: [p7, p7, p7, p7, p7],
    //   },
    //   title: 'White sneakers',
    //   discription: 'Data about sneaker',
    //   type: 'shoes',
    //   isFav: false,
    // ),
    // Product(
    //   id: 'p8',
    //   price: 79.99,
    //   imageUrl: {
    //     p6: [p6, p6, p6, p6, p6]
    //   },
    //   title: 'Dark sneakers',
    //   discription: 'Data about sneaker',
    //   type: 'shoes',
    //   isFav: false,
    // ),
    // Product(
    //   id: 'p9',
    //   price: 179.99,
    //   imageUrl: {
    //     p10: [p10, p10, p10, p10, p10],
    //   },
    //   title: 'Cool Jacket',
    //   discription: 'Data about jacket',
    //   type: 'jacket',
    //   isFav: false,
    // ),
    // Product(
    //   id: 'p10',
    //   price: 69.99,
    //   imageUrl: {
    //     p9: [p9, p9, p9, p9, p9]
    //   },
    //   title: 'Bike Jacket',
    //   discription: 'Data about jacket',
    //   type: 'jacket',
    //   isFav: false,
    // ),
    // Product(
    //   id: 'p12',
    //   price: 159.99,
    //   imageUrl: {
    //     p10: [p10, p10, p10, p10],
    //   },
    //   title: 'Cool Jacket',
    //   discription: 'Data about jacket',
    //   type: 'jacket',
    //   isFav: false,
    // ),
    // Product(
    //   id: 'p13',
    //   price: 179.99,
    //   imageUrl: {
    //     p9: [p9, p9, p9, p9],
    //   },
    //   title: 'Cool Jacket',
    //   discription: 'Data about jacket',
    //   type: 'jacket',
    //   isFav: false,
    // ),
  ];

  List<Product> get item {
    return [..._item];
  }

  Future<void> fetchProducts() async {
    Map<String, dynamic>? extractedData;
    const url =
        'https://ecomproject-8ccb9-default-rtdb.firebaseio.com/products.json';
    final parsedUrl = Uri.parse(url);
    try {
      final response = await http.get(parsedUrl);
      extractedData = json.decode(response.body) != null
          ? json.decode(response.body) as Map<String, dynamic>
          : null;

      final List<Product> loadedProducts = [];
      extractedData?.forEach((prodId, prodData) {
        double productprice = prodData['price'];

        loadedProducts.add(Product(
          id: prodId,
          title: prodData['title'],
          discription: prodData['discription'],
          price: productprice,
          // isFavorite: prodData['isFavorite'],
          imageUrl: {
            prodData['imageUrl']: [
              prodData['imageUrl'],
              prodData['imageUrl'],
              prodData['imageUrl'],
              prodData['imageUrl']
            ]
          },
          type: prodData['type'],
          isFav: prodData['isFav'],
          // isCart: prodData['isCart'],
        ));
      });
      _item = loadedProducts;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addProduct(Product prod) async {
    const url =
        'https://ecomproject-8ccb9-default-rtdb.firebaseio.com/products.json';
    final parsedUrl = Uri.parse(url);

    try {
      final response = await http.post(
        parsedUrl,
        body: json.encode(
          {
            'title': prod.title,
            'price': prod.price,
            'imageUrl': prod.imageUrl.keys.single,
            'discription': prod.discription,
            'type': prod.type,
            'isFav': prod.isFav,
            // 'isCart': prod.isCart,
          },
        ),
      );
      var newItem = Product(
        id: json.decode(response.body)['name'],
        // id: DateTime.now().toString(),
        title: prod.title,
        price: prod.price,
        imageUrl: prod.imageUrl,
        discription: prod.discription,
        type: prod.type,
      );
      _item.add(newItem);
      notifyListeners();
    }
    // on Exception catch (error) {
    //   throw Exception('somthing happened$error');

    // }
    catch (e) {
      rethrow;
    }
  }

  // void uploadItem() {
  //   item.forEach((element) {
  //     addProduct(element);
  //     print(element.id);
  //   });
  //   print('succesful');
  // }

  Future<void> upDateProduct(String prodid, Product newProduct) async {
    // final index = _item.firstWhere((element) => element.id == prodid);
    // print(index);
    // _item.
    final url = Uri.parse(
        'https://ecomproject-8ccb9-default-rtdb.firebaseio.com/products/$prodid.json');
    final prodIndex = _item.indexWhere((prod) => prod.id == prodid);

    if (prodIndex >= 0) {
      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'price': newProduct.price,
            'imageUrl': newProduct.imageUrl.keys.single,
            'discription': newProduct.discription,
            'type': newProduct.type,
          }));

      _item[prodIndex] = newProduct;
      notifyListeners();
    }
  }

  List<Product> fliterItem(String value) {
    return _item.where((prodElement) => prodElement.type == value).toList();
  }

  Product findById(String id) {
    return _item.firstWhere((prod) => prod.id == id);
  }

  Future<void> toggleFavStatus(Product prod) async {
    bool prev = prod.isFav;
    final id = prod.id;
    final url =
        'https://ecomproject-8ccb9-default-rtdb.firebaseio.com/products/$id.json';
    final parsedUrl = Uri.parse(url);
    prod.isFav = !prod.isFav;
    notifyListeners();
    try {
      final response = await http.patch(
        parsedUrl,
        body: json.encode(
          {'isFav': prod.isFav},
        ),
      );
      if (response.statusCode >= 400) {
        prod.isFav = prev;
      }
    } catch (e) {
      prod.isFav = prev;
    }
  }

  List<Product> get favFilter {
    return _item.where((prod) => prod.isFav == true).toList();
  }

  List<Product> searchFilter(String value) {
    return _item
        .where((prodElement) => prodElement.title.toLowerCase().contains(value))
        .toList();
  }

  Future<void> removeProduct(String id) async {
    final url = Uri.parse(
        'https://ecomproject-8ccb9-default-rtdb.firebaseio.com/products/$id.json');
    try {
      await http.delete(url);
      _item.removeWhere((element) => element.id == id);
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }
}
