import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/features/about_us/bloc/about_us_bloc.dart';
import 'package:harri_farm_app/features/add_address/bloc/add_address_bloc.dart';
import 'package:harri_farm_app/features/add_address/bloc/get_cities_and_regions_bloc.dart';
import 'package:harri_farm_app/features/addresses/bloc/addresses_bloc.dart';
import 'package:harri_farm_app/features/all_offers/bloc/all_offers_bloc.dart';
import 'package:harri_farm_app/features/cart/bloc/cart_bloc.dart';
import 'package:harri_farm_app/features/cart/bloc/cart_coupon_bloc.dart';
import 'package:harri_farm_app/features/contact_us/bloc/contact_us_bloc.dart';
import 'package:harri_farm_app/features/faq/bloc/faq_bloc.dart';
import 'package:harri_farm_app/features/favorite/bloc/favorite_bloc.dart';
import 'package:harri_farm_app/features/forgot_password/bloc/forget_password_bloc.dart';
import 'package:harri_farm_app/features/home/bloc/home_bloc.dart';
import 'package:harri_farm_app/features/login/bloc/login_bloc.dart';
import 'package:harri_farm_app/features/my_orders/bloc/my_orders_bloc.dart';
import 'package:harri_farm_app/features/my_orders_details/bloc/my_orders_details_bloc.dart';
import 'package:harri_farm_app/features/notifications/bloc/notifications_bloc.dart';
import 'package:harri_farm_app/features/privacy_policy/bloc/privacy_policy_bloc.dart';
import 'package:harri_farm_app/features/product_details/bloc/product_details_bloc.dart';
import 'package:harri_farm_app/features/rate_service/bloc/rate_service_bloc.dart';
import 'package:harri_farm_app/features/register/bloc/register_bloc.dart';
import 'package:harri_farm_app/features/reset_password/bloc/reset_password_bloc.dart';
import 'package:harri_farm_app/features/return_and_exchange_policy/bloc/return_and_exchange_bloc.dart';
import 'package:harri_farm_app/features/sections/bloc/sections_bloc.dart';
import 'package:harri_farm_app/features/sections/bloc/section_items_bloc.dart';
import 'package:harri_farm_app/features/shipping_and_delivery_policy/bloc/shipping_policy_bloc.dart';
import 'package:harri_farm_app/features/update_profile/bloc/update_profile_bloc.dart';
import 'package:harri_farm_app/features/verification/bloc/verification_bloc.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/pop_scaffold.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/features/splash/view/splash_view.dart';
import 'package:harri_farm_app/network/network_layer.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Network.lang = context.locale.languageCode;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      child: const SplashView(),
      builder: (_, child) => KeyboardPopScaffold(
        //TODO: Transform to using the app providers
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => RegisterBloc(),
            ),
            BlocProvider(
              create: (context) => LoginBloc(),
            ),
            BlocProvider(
              create: (context) => ForgetPasswordBloc(),
            ),
            BlocProvider(
              create: (context) => VerificationBloc(),
            ),
            BlocProvider(
              create: (context) => ResetPasswordBloc(),
            ),
            BlocProvider(
              create: (context) => HomeBloc()..add(Get()),
            ),
            BlocProvider(
              create: (context) => AllOffersBloc()..add(Get()),
            ),
            BlocProvider(
              create: (context) => SectionBloc(),
            ),
            BlocProvider(
              create: (context) => NotificationBloc(),
            ),
            BlocProvider(
              create: (context) => UpdateProfileBloc(),
            ),
            BlocProvider(
              create: (context) => MyOrdersBloc(),
            ),
            BlocProvider(
              create: (context) => MyOrdersDetailsBloc(),
            ),
            BlocProvider(
              create: (context) => RateServiceBloc(),
            ),
            BlocProvider(
              create: (context) => ShippingPolicyBloc(),
            ),
            BlocProvider(
              create: (context) => ReturnAndExchangeBloc(),
            ),
            BlocProvider(
              create: (context) => FaqBloc(),
            ),
            BlocProvider(
              create: (context) => PrivacyPolicyBloc(),
            ),
            BlocProvider(
              create: (context) => AboutUsBloc(),
            ),
            BlocProvider(
              create: (context) => FavouriteBloc(),
            ),
            BlocProvider(
              create: (context) => SectionItemsBloc(),
            ),
            BlocProvider(
              create: (context) => AddressesBloc(),
            ),
            BlocProvider(
              create: (context) => AddAddressBloc(),
            ),
            BlocProvider(
              create: (context) => CitiesAndRegionsBloc(),
            ),
            BlocProvider(
              create: (context) => ContactUsBloc(),
            ),
            BlocProvider(
              create: (context) => ProductDetailsBloc(),
            ),
            BlocProvider(
              create: (context) => CartBloc(),
            ),
            BlocProvider(
              create: (context) => CartCouponBloc(),
            ),
          ],
          child: MaterialApp(
            title: 'Harri',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              hoverColor: Colors.transparent,
              useMaterial3: false,
              fontFamily: 'Cairo',
              scaffoldBackgroundColor: AppColors.background,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              primaryColor: AppColors.primary,
            ),
            onGenerateRoute: onGenerateRoute,
            navigatorKey: navigatorKey,
            home: child,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
            ],
            locale: context.locale,
          ),
        ),
      ),
    );
  }
}
