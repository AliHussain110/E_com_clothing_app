import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Material(
        elevation: 18,
        shadowColor: Colors.black,
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'What are u looking For?',
              hintStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
