// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/features/sections/bloc/section_items_bloc.dart';
import 'package:harri_farm_app/features/sections/models/sections_model.dart';
import 'package:harri_farm_app/features/sections/widgets/sections_tab.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';

class SectionsTabBars extends StatefulWidget {
  final List<SubCategory>? subCategory;
  final bool isFiltering;

  const SectionsTabBars({Key? key, this.subCategory, required this.isFiltering})
      : super(key: key);

  @override
  _SectionsTabBarsState createState() => _SectionsTabBarsState();
}

class _SectionsTabBarsState extends State<SectionsTabBars> {
  int? _currentViewIndex = 0;

  void _changeView(int index) {
    setState(() {
      _currentViewIndex = widget.isFiltering == true ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var index = 0; index < widget.subCategory!.length; index++)
            SectionsTab(
                isSelected: _currentViewIndex == index,
                title: widget.subCategory?[index].name ?? "",
                onTap: () {
                  _changeView(index);
                  SectionItemsBloc.of(context).add(Read(
                      arguments: widget.subCategory![index].id.toString()));
                }),
        ],
      ),
    );
  }
}
