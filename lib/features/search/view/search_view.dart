import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/search/bloc/search_bloc.dart';
import 'package:harri_farm_app/features/search/widgets/search_app_bar.dart';
import 'package:harri_farm_app/features/search/widgets/search_field.dart';
import 'package:harri_farm_app/features/search/widgets/search_main_title.dart';
import 'package:harri_farm_app/features/search/widgets/search_product_card.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppBar(),
      body: AppDecoratedBackGround(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.height),
                const SearchMainTitle(),
                SizedBox(height: 16.height),
                const SearchSearchField(),
                SizedBox(height: 24.height),
                BlocBuilder<SearchBloc, AppState>(
                  builder: (context, state) {
                    final bloc = SearchBloc.of(context);
                    if (state is Loading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      );
                    } else if (state is Done) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 6.height,
                            crossAxisSpacing: 32.width,
                            childAspectRatio: 3 / 6.4,
                          ),
                          itemCount: bloc.searchData.data!.length,
                          itemBuilder: (context, index) {
                            return SearchProductCard(
                              searchItem: bloc.searchData.data![index],
                            );
                          },
                        ),
                      );
                    } else if (state is Error) {
                      return Text(bloc.searchData.message.toString());
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
