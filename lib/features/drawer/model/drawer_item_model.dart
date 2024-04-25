import 'package:flutter/material.dart';

class DrawerItemModel {
  final String imagePath;
  final String title;
  final VoidCallback onTap;
  bool? noArrow;

  DrawerItemModel({
    required this.imagePath,
    required this.title,
    required this.onTap,
    this.noArrow,
  });
}
