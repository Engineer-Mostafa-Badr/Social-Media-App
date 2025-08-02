import 'package:social_media_app/feature/splash_screen/view/splash_screen.dart';
import 'package:social_media_app/core/components/posts/bloc/posts_cubit.dart';
import 'package:social_media_app/core/components/chating/view/chatting.dart';
import 'package:social_media_app/feature/registration/registration.dart';
import 'package:social_media_app/core/components/add_post/add_post.dart';
import 'package:social_media_app/feature/profile/view/profile.dart';
import 'package:social_media_app/config/route/app_route.dart';
import 'package:social_media_app/data/model/post_model.dart';
import 'package:social_media_app/feature/home/home.dart';
import 'package:flutter/material.dart';

class OnGenerate {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case AppRoute.registerScreen:
        return MaterialPageRoute(builder: (context) => const Registration());
      case AppRoute.home:
        return MaterialPageRoute(builder: (context) => Home());
      case AppRoute.addPost:
        return MaterialPageRoute(
          builder:
              (context) => AddPost(
                postsCubit: (settings.arguments as List).first as PostsCubit,
                postEdit:
                    ((settings.arguments as List).length > 1
                            ? (settings.arguments as List).lastOrNull
                            : null)
                        as PostModel?,
              ),
        );
      case AppRoute.profile:
        return MaterialPageRoute(
          builder:
              (context) =>
                  Profile(userData: (settings.arguments as List).first),
        );
      case AppRoute.chatting:
        return MaterialPageRoute(
          builder:
              (context) => Chatting(toUser: (settings.arguments as List).first),
        );

      default:
    }
    return null;
  }
}
