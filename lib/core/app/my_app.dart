import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_tasck_app/core/api/api_consumer.dart';
import 'package:flutter_tasck_app/core/api/dio_consumer.dart';
import 'package:flutter_tasck_app/core/generated/l10n.dart';
import 'package:flutter_tasck_app/core/routing/app_routes.dart';
import 'package:flutter_tasck_app/core/theme/app_theme.dart';
import 'package:flutter_tasck_app/features/auth/cubit/login_cubit.dart';
import 'package:flutter_tasck_app/features/auth/data/services/auth_services.dart';
import 'package:flutter_tasck_app/features/home/cubit/fetch_products_cubit.dart';
import 'package:flutter_tasck_app/features/home/cubit/horizontal_fetch_products_cubit.dart';
import 'package:flutter_tasck_app/features/home/data/services/product_services.dart';
// import 'package:flutter_tasck_app/features/auth/data/services/auth_services.dart';
import 'package:flutter_tasck_app/shared/data/services/storage_service.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeHWFSize(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final storage = StorageService();
    final dioConsumer = DioConsumer(dio: Dio(), storageService: storage);

    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(
            authRemoteDataSource: AuthServicesImpl(apiConsumer: dioConsumer),
            storageService: storage,
          ),
        ),

        // FetchProductsCubit provider: call fetchProducts on create
        BlocProvider<FetchProductsCubit>(
          create: (context) =>
              FetchProductsCubit(ProductServicesImpl(apiConsumer: dioConsumer))
                ..fetchProducts(limit: 10, skip: 0),
        ),
        BlocProvider<HorizontalFetchProductsCubit>(
          create: (context) => HorizontalFetchProductsCubit(
            ProductServicesImpl(apiConsumer: dioConsumer),
          )..fetchHorizontalProducts(limit: 10, skip: 0),
        ),
      ],
      child: MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Task',
        theme: AppThemeData.lightTheme(),
        initialRoute: AppRoutes.splashScreen,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
