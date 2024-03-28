import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harri_farm_app/features/register/bloc/register_bloc.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/pop_scaffold.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/features/splash/view/view.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
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
