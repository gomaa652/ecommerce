import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yalla_client/core/constants/app_string_constants.dart';
import 'package:yalla_client/core/dependencies/dependency_init.dart';
import 'package:yalla_client/core/utilities/appKeys.dart';
import 'package:yalla_client/core/utilities/configs/core_theme.dart';
import 'package:yalla_client/core/utilities/environment/environment_configurations.dart';
import 'package:yalla_client/core/utilities/routes_navigator/route_generator.dart';
import 'package:yalla_client/translations/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // init environment
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: EnvironmentsVariables.development,
  );

  // init Environments Variables
  EnvironmentsVariables().initConfig(environment);

  // init Hive ( data storage )
  await Hive.initFlutter();
  // Hive.registerAdapter(AppAuthenticationStateEnumAdapter());

  // init get it for all Dependencies
  getIt.registerSingleton(Dio());
  configureDependencies();
  await getIt.allReady();
  runApp(
    EasyLocalization(
        path: 'assets/translation',
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
          Locale('ku'),
        ],
        startLocale: const Locale('ar'),
        fallbackLocale: const Locale('ar'),
        assetLoader: const CodeGenLoader(),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialChild();
  }
}

class MaterialChild extends StatefulWidget {
  const MaterialChild({
    super.key,
  });

  @override
  State<MaterialChild> createState() => _MaterialChildState();
}

class _MaterialChildState extends State<MaterialChild> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: AppKeys.materialKey,
            debugShowCheckedModeBanner: false,
            title: AppStringConstants.appName,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            theme: themeLight,
            darkTheme: themeDark,
            themeMode: ThemeMode.light,
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        });
  }
}
