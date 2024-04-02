import 'package:flutter/material.dart';

class AppTopViewedCard extends StatelessWidget {
  final String imagePath;
  const AppTopViewedCard({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
