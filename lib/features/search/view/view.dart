import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/search/widgets/search_app_bar.dart';
import 'package:harri_farm_app/features/search/widgets/search_field.dart';
import 'package:harri_farm_app/features/search/widgets/search_main_title.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppBar(),
      body: AppDecoratedBackGround(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.height),
              const SearchMainTitle(),
              SizedBox(height: 16.height),
              const SearchSearchField()
            ],
          ),
        ),
      ),
    );
  }
}
