import 'dart:async';

import 'package:clothes_app/providers/product_providers.dart';

import 'package:clothes_app/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class EditProductPage extends StatefulWidget {
  static const routeName = 'editproduct';

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  // focus node to transfer the foucs in keyboard after pressing next
  final _priceFocusNode = FocusNode();
  final _typeFocusNode = FocusNode();
  final _discriptionFocusNode = FocusNode();
  final _imageFocusNode = FocusNode();

  //editing controllers for the keyboard controls or to get dat;
  final _imageUrlController = TextEditingController();
  String imageUrlValue = '';
  // to intaialise the model route data for the first time
  bool isInit = true;
  //isFalse is for checking if product is new or edit product
  bool isFalse = false;
  bool isLoading = false;
  bool setImage = false;

  final _form = GlobalKey<FormState>();
  //to get values for edititng the product
  var intialValues = {
    'title': '',
    'price': '',
    'dis': '',
    'type': '',
    'imgUrl': '',
  };
  var _exsistingValues = Product(
    id: '',
    title: '',
    price: 0,
    imageUrl: {'': []},
    discription: '',
    type: '',
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageFocusNode.addListener(() {
      if (_imageFocusNode.hasFocus == false) {
        print('heo');
        imageValidator();
      }
    });
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      if (ModalRoute.of(context)?.settings.arguments is String) {
        isFalse = true;
        final prodid = ModalRoute.of(context)?.settings.arguments as String;
        _exsistingValues = Provider.of<Products>(context).findById(prodid);
        intialValues = {
          'title': _exsistingValues.title,
          'price': _exsistingValues.price.toString(),
          'dis': _exsistingValues.discription,
          'type': _exsistingValues.type,
          'imgUrl': '',
        };
        imageUrlValue = _exsistingValues.imageUrl.keys.single;
        _imageUrlController.text = _exsistingValues.imageUrl.keys.single;
      }
    }
    isInit = false;
    super.didChangeDependencies();
  }

  void onSubmitted() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    final products = Provider.of<Products>(context, listen: false);
    _form.currentState!.save();
    if (isFalse) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Product Updated'),
        duration: Duration(seconds: 2),
      ));
      products.upDateProduct(_exsistingValues.id, _exsistingValues);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('New Product Added'),
        duration: Duration(seconds: 2),
      ));
      products.addProduct(_exsistingValues);
    }
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pop();
    });
  }

  void imageValidator() {
    setState(() {
      setImage = false;
      imageUrlValue = _imageUrlController.text;
      _form.currentState!.validate();
    });
  }

  @override
  void dispose() {
    _discriptionFocusNode.dispose();
    _exsistingValues.dispose();
    _typeFocusNode.dispose();
    _imageFocusNode.dispose();
    _imageUrlController.dispose();
    _priceFocusNode.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                onSubmitted();
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _form,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Material(
                      elevation: 18,
                      shadowColor: Colors.black,
                      child: TextFormField(
                        initialValue: intialValues['title'],
                        decoration: InputDecoration(
                          label: const Text('title'),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return 'Enter the Value';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _exsistingValues = Product(
                            id: _exsistingValues.id,
                            title: value!,
                            price: _exsistingValues.price,
                            imageUrl: _exsistingValues.imageUrl,
                            discription: _exsistingValues.discription,
                            type: _exsistingValues.type,
                          );
                        },
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_priceFocusNode);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Material(
                      elevation: 18,
                      shadowColor: Colors.black,
                      child: TextFormField(
                        initialValue: intialValues['price'],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: const Text('Price'),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return 'Enter the Value';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _exsistingValues = Product(
                            id: _exsistingValues.id,
                            title: _exsistingValues.title,
                            price: double.parse(value!),
                            imageUrl: _exsistingValues.imageUrl,
                            discription: _exsistingValues.discription,
                            type: _exsistingValues.type,
                          );
                        },
                        focusNode: _priceFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_typeFocusNode);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Material(
                      elevation: 18,
                      shadowColor: Colors.black,
                      child: DropdownButtonFormField(
                        items: const [
                          DropdownMenuItem(
                              value: "clothes", child: Text('Clothes')),
                          DropdownMenuItem(
                              value: "jacket", child: Text('Jackets')),
                          DropdownMenuItem(
                              value: "shoes", child: Text('Shoes')),
                        ],
                        value: intialValues['type']!.isEmpty
                            ? 'clothes'
                            : intialValues['type'],
                        onChanged: (_) {},
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: const Text('Type'),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Enter the type';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _exsistingValues = Product(
                            id: _exsistingValues.id,
                            title: _exsistingValues.title,
                            price: _exsistingValues.price,
                            imageUrl: _exsistingValues.imageUrl,
                            discription: _exsistingValues.discription,
                            type: value!.toString(),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Material(
                      elevation: 18,
                      shadowColor: Colors.black,
                      child: TextFormField(
                        initialValue: intialValues['dis'],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: const Text('Discription'),
                        ),
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return 'Enter the Value';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _exsistingValues = Product(
                            id: _exsistingValues.id,
                            title: _exsistingValues.title,
                            price: _exsistingValues.price,
                            imageUrl: _exsistingValues.imageUrl,
                            discription: value!.toString(),
                            type: _exsistingValues.type,
                          );
                        },
                        focusNode: _discriptionFocusNode,
                        maxLines: 3,
                      ),
                    ),
                  ),
                  Material(
                    elevation: 18,
                    shadowColor: Colors.black,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(
                                top: 10, right: 10, left: 10),
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                              ),
                            ),
                            child: _imageUrlController.text.isEmpty
                                ? const Text('Enter the Url')
                                : Image.network(
                                    imageUrlValue,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        ((context, error, stackTrace) {
                                      setImage = true;
                                      return Image.asset('assets/img10.jpg',
                                          fit: BoxFit.cover);
                                    }),
                                  )),
                        Expanded(
                          child: TextFormField(
                            autofillHints: const [
                              'assets/img1.png',
                              'assets/img2.png',
                              'assets/img3.png',
                              'assets/img3.png'
                            ],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              label: const Text('Url'),
                            ),
                            controller: _imageUrlController,
                            textInputAction: TextInputAction.done,
                            onSaved: (value) {
                              _exsistingValues = Product(
                                id: _exsistingValues.id,
                                title: _exsistingValues.title,
                                price: _exsistingValues.price,
                                imageUrl: {
                                  value!: [value, value, value, value, value]
                                },
                                discription: _exsistingValues.discription,
                                type: _exsistingValues.type,
                              );
                            },
                            validator: (value) {
                              print(setImage);
                              if (value?.isEmpty == true) {
                                return 'Enter the Value';
                              } else if (setImage == true) {
                                return 'url is not vaild';
                              }
                              return null;
                            },
                            onFieldSubmitted: (_) {
                              imageValidator();
                            },
                            focusNode: _imageFocusNode,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
