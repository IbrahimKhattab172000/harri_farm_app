import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_storage.dart';
import 'package:harri_farm_app/features/forgot_password/bloc/forget_password_bloc.dart';
import 'package:harri_farm_app/features/home/bloc/home_bloc.dart';
import 'package:harri_farm_app/features/login/bloc/login_bloc.dart';
import 'package:harri_farm_app/features/register/bloc/register_bloc.dart';
import 'package:harri_farm_app/features/reset_password/bloc/reset_password_bloc.dart';
import 'package:harri_farm_app/features/verification/bloc/verification_bloc.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/pop_scaffold.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/features/splash/view/view.dart';
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
