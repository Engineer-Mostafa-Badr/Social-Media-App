import 'package:social_media_app/config/firebase/firebase_options.dart';
import 'package:social_media_app/config/lang/app_localizations.dart';
import 'package:social_media_app/data/data_helper/app_data.dart';
import 'package:social_media_app/config/route/on_generate.dart';
import 'config/controller_app/cubit/app_controller_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider<AppData>(create: (context) => AppData())],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return BlocProvider<AppControllerCubit>(
            create: (context) => AppControllerCubit(),
            child: BlocBuilder<AppControllerCubit, AppControllerState>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  locale: state.appLang,
                  supportedLocales: AppLocalizations.supportedLocales,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  theme: ThemeData(
                    useMaterial3: true,
                    brightness: state.appTheme,
                  ),
                  onGenerateRoute: OnGenerate().onGenerateRoute,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
