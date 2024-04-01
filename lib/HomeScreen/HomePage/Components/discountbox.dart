import 'package:flutter/material.dart';

class DiscountBox extends StatelessWidget {
  const DiscountBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 20,
      ),

      alignment: Alignment.center,
      // margin: const EdgeInsets.all(20),
      height: 180,
      // width: 440,
      // width: double.minPositive,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        color: Colors.orange[700],
      ),
      child: const Text(
        '70% Off\non Everything',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
