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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(
            authRemoteDataSource: AuthServicesImpl(
              apiConsumer: DioConsumer(
                dio: Dio(),
                storageService: StorageService(),
              ),
            ),
            storageService: StorageService(),
          ),
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
        theme: AppTheme.light,
        initialRoute: AppRoutes.splashScreen,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
