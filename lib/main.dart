import 'package:flutter/material.dart';

import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(Color.fromARGB(255, 18, 1, 46),Color.fromARGB(255, 114, 73, 185))
               //GradientContainer.purple(),
      ),
    ),
  );
}

