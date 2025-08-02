import 'package:social_media_app/config/controller_app/cubit/app_controller_cubit.dart';
import '../../core/components/posts/post_view_and_show_posts.dart';
import 'package:social_media_app/core/custom_widget/app_text.dart';
import 'package:social_media_app/data/data_helper/app_data.dart';
import 'package:social_media_app/config/route/app_route.dart';
import 'package:social_media_app/core/extension/context.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:social_media_app/core/extension/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:slide_switcher/slide_switcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'widget/drawer.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final GlobalKey<ScaffoldState> keyScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        key: keyScaffold,
        backgroundColor: context.theme.backgroundAppColor,
        drawer: Drawer(
          backgroundColor: context.theme.backgroundAppColor,
          child: const _DrawerHome(),
        ),
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 50.h),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.theme.buttonColor,
                  Colors.pink.shade200,
                  context.theme.backgroundAppColor,
                ],
              ),
            ),
            child: Row(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3.h),
                  child: AppText(text: 'Facebook and Insta', fontSize: 17.sp),
                ),
                IconButton(
                  onPressed: () {
                    keyScaffold.currentState!.openDrawer();
                  },
                  icon: Icon(Icons.menu, size: 3.h),
                ),
              ],
            ),
          ),
        ),
        body: AddPostAndPostsView(keyScaffold: keyScaffold),
      ),
    );
  }
}
