import '/HomeScreen/HomePage/Components/inputbox.dart';
import 'package:flutter/material.dart';
import '/HomeScreen/HomePage/Components/shopelist.dart';
import '/HomeScreen/HomePage/Components/discountbox.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        WelcomeText(),
        const InputBox(),
        const DiscountBox(),
        const ShopeTextBox(shopeName: 'Shope the look'),
        ShopeList('clothes'),
        const ShopeTextBox(shopeName: 'Shoes'),
        const ShopeBanner(img: 'assets/img3.png'),
        ShopeList('shoes'),
        const ShopeTextBox(shopeName: 'Jackets'),
        const ShopeBanner(img: 'assets/img6.png'),
        ShopeList('jacket'),

        // ShopeBanner(img: 'assets/img6.png'),
        // ShopeList(
        //   img1: 'assets/img7.jpeg',
        //   img2: 'assets/img8.jpeg',
        //   text1: 'Cool Jacket',
        //   text2: 'Biker Jacket',
        // ),
      ],
    );
  }
}

class ShopeBanner extends StatelessWidget {
  final String img;
  const ShopeBanner({
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 20, left: 30, bottom: 20),
      child: const Text(
        'Welcome back\nAli',
        style: TextStyle(
          // fontStyle: FontStyle.italic,
          fontSize: 35,
        ),
      ),
    );
  }
}

class ShopeTextBox extends StatelessWidget {
  final String shopeName;
  const ShopeTextBox({
    required this.shopeName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        left: 30,
      ),
      child: Text(
        shopeName,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    );
  }
}
