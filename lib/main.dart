import 'package:bloc_boiler_plate/config/flavour_config.dart';
import 'package:bloc_boiler_plate/constants/enum_constants.dart';
import 'package:bloc_boiler_plate/features/authentication/repository/auth_repository.dart';
import 'package:bloc_boiler_plate/localizations/app_localization.dart';
import 'package:bloc_boiler_plate/routing/app_routes.dart';
import 'package:bloc_boiler_plate/simple_bloc_observer.dart';
import 'package:bloc_boiler_plate/theme/app_styles.dart';
import 'package:bloc_boiler_plate/theme/colors.dart';
import 'package:bloc_boiler_plate/utils/initialization_repository.dart';
import 'package:bloc_boiler_plate/utils/navigator_service.dart';
import 'package:bloc_boiler_plate/utils/pref_utils.dart';
import 'package:bloc_boiler_plate/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

const Environment environment = Environment.development;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final config = FlavorConfig(
    appName: "Development App",
    apiBaseUrl: "https://dummyjson.com",
    env: Env.dev,
  );
  Bloc.observer = const SimpleBlocObserver();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init(),
  ]).then((value) {
    runApp(MyApp(
      flavorConfig: config,
    ));
  });
}

class MyApp extends StatelessWidget {
  final FlavorConfig flavorConfig;

  const MyApp({super.key, required this.flavorConfig});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<InitializationRepository>(
            lazy: true,
            create: (context) => InitializationRepository()..init(flavorConfig),
          ),
          RepositoryProvider<AuthRepository>(
            create: (context) => AuthRepository(
              dioClient: context.read<InitializationRepository>().dioClient,
            ),
          ),
        ],
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: MaterialApp(
            title: 'Bloc Architecture Demo',
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigatorService.navigatorKey,
            locale: const Locale('en', ''),
            localizationsDelegates: const [
              AppLocalizationDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
                fontFamily: 'Poppins',
                colorScheme: const ColorScheme.light(
                  primary: primaryColor,
                  secondary: secondaryColor,
                  background: Colors.white,
                ),
                useMaterial3: true,
                scaffoldBackgroundColor: Colors.white,
                textTheme: TextTheme(
                  bodyLarge: CustomTextStyles.bodyLarge,
                  bodyMedium: CustomTextStyles.bodyMedium,
                  bodySmall: CustomTextStyles.bodySmall,
                  displaySmall: CustomTextStyles.displaySmall,
                  headlineMedium: CustomTextStyles.headlineMedium,
                  labelLarge: CustomTextStyles.labelLarge,
                  titleLarge: CustomTextStyles.titleLarge,
                  titleMedium: CustomTextStyles.titleMedium,
                  titleSmall: CustomTextStyles.titleSmall,
                )),
            initialRoute: AppRoutes.splashScreen,
            routes: AppRoutes.routes,
          ),
        ),
      );
    });
  }
}
