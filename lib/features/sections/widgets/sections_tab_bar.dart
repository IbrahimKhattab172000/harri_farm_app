import 'package:flutter/material.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/features/sections/bloc/sections_bloc.dart';
import 'package:harri_farm_app/features/sections/models/sections_model.dart';
import 'package:harri_farm_app/features/sections/widgets/sections_tab.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';

class SectionsTabBars extends StatefulWidget {
  final List<SubCategory>? subCategory;

  const SectionsTabBars({Key? key, this.subCategory}) : super(key: key);

  @override
  _SectionsTabBarsState createState() => _SectionsTabBarsState();
}

class _SectionsTabBarsState extends State<SectionsTabBars> {
  int? _currentViewIndex;

  void _changeView(int index) {
    setState(() {
      _currentViewIndex = index;
    });
  }

  // @override
  // void initState() {
  //   SectionBloc.of(context)
  //       .add(Read(arguments: widget.subCategory!.first.id.toString()));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var index = 0; index < widget.subCategory!.length; index++)
            SectionsTab(
                isSelected: _currentViewIndex == index,
                title: widget.subCategory?[index].name ?? "",
                onTap: () {
                  _changeView(index);
                  // SectionBloc.of(context).add(Read(arguments: "$index"));
                  SectionBloc.of(context).add(Read(
                      arguments: widget.subCategory![index].id.toString()));
                }),
        ],
      ),
    );
  }
}
