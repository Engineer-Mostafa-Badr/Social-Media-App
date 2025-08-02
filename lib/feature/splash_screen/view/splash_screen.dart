import 'package:social_media_app/feature/splash_screen/bloc/splash_screen_cubit.dart';
import 'package:social_media_app/core/custom_widget/app_text.dart';
import 'package:social_media_app/core/enum/navigator_splash.dart';
import 'package:social_media_app/core/extension/context.dart';
import 'package:social_media_app/config/route/app_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashScreenCubit>(
      create: (contextB) => SplashScreenCubit(context: context),
      child: BlocListener<SplashScreenCubit, SplashScreenState>(
        listener: (context, state) {
          switch (state.navigatorSplash) {
            case NavigatorSplash.home:
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoute.home,
                (route) => false,
              );
              break;
            case NavigatorSplash.registration:
              if (state.error.isNotEmpty) {
                Fluttertoast.showToast(
                  msg: state.error,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoute.registerScreen,
                (route) => false,
              );
              break;
            default:
          }
        },
        listenWhen:
            (previous, current) =>
                previous.navigatorSplash != current.navigatorSplash,
        child: Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppText(text: 'Facebook and Insta', fontSize: 22),
                SizedBox(height: 5.h),
                CircularProgressIndicator(color: context.theme.primaryColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
