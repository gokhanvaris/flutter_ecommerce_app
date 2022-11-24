import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app_router.dart';
import 'package:flutter_ecommerce_app/bloc/bloc_providers.dart';
import 'package:flutter_ecommerce_app/theme/theme.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('tr', 'TR')
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: MultiBlocProvider(
          providers: [
            ...BlocProviders.instance.providers,
          ],
          child: const GetMaterialApp(
              home: MyApp()))));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp.router(
      localizationsDelegates:
          context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: AppRouter().router,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppDefaultTheme().themeData,
    );
  }
}
