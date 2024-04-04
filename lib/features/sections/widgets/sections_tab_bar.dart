import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/sections/models/sections_model.dart';
import 'package:harri_farm_app/features/sections/widgets/sections_tab.dart';

class SectionsTabBars extends StatefulWidget {
  final List<SubCategory>? subCategory;
  const SectionsTabBars({Key? key, this.subCategory}) : super(key: key);

  @override
  _SectionsTabBarsState createState() => _SectionsTabBarsState();
}

class _SectionsTabBarsState extends State<SectionsTabBars> {
  int _currentViewIndex = 0;

  void _changeView(int index) {
    setState(() {
      _currentViewIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.subCategory!.map((element) {
        return SectionsTab(
          isSelected: _currentViewIndex == 0,
          title: element.name ?? "",
          onTap: () => _changeView(0),
        );
      }).toList(),
    );
  }
}
