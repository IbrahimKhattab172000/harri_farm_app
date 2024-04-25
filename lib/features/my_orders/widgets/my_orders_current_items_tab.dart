import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/my_orders/bloc/my_orders_bloc.dart';
import 'package:harri_farm_app/features/my_orders/widgets/my_orders_card.dart';
import 'package:harri_farm_app/features/my_orders_details/bloc/my_orders_details_bloc.dart';
import 'package:harri_farm_app/features/my_orders_details/view/view.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_empty_screen.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class MyOrdersCurrentItemsTab extends StatelessWidget {
  const MyOrdersCurrentItemsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersBloc, AppState>(
      builder: (context, state) {
        final bloc = MyOrdersBloc.of(context);

        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (bloc.myOrdersData.data?.newOrder == null) {
          return const AppEmptyScreen(title: "add_some_products_to_your_cart");
        } else if (state is Error) {
          return Center(child: AppText(title: 'error_loading_data'.tr()));
        } else if (state is Done) {
          return Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: bloc.myOrdersData.data?.newOrder?.length ?? 0,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 8.height),
              itemBuilder: (context, index) {
                return MyOrdersCard(
                  status: bloc.myOrdersData.data?.newOrder?[index].status ?? "",
                  date: bloc.myOrdersData.data?.newOrder?[index].date ?? "",
                  id: bloc.myOrdersData.data?.newOrder?[index].id.toString() ??
                      "",
                  name: bloc.myOrdersData.data?.newOrder?[index].note ?? "",
                  price:
                      bloc.myOrdersData.data?.newOrder?[index].finalPrice ?? "",
                  onTap: () {
                    MyOrdersDetailsBloc.of(context).add(
                      Click(
                        arguments: bloc.myOrdersData.data?.newOrder?[index].id,
                      ),
                    );
                    RouteUtils.navigateTo(
                      MyOrdersDetailsView(
                        status:
                            bloc.myOrdersData.data?.newOrder?[index].status ??
                                "",
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1,
                  color: AppColors.lightGray,
                );
              },
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
