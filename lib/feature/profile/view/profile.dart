// ignore_for_file: use_build_context_synchronously
import 'package:social_media_app/core/components/posts/post_view_and_show_posts.dart';
import 'package:social_media_app/core/custom_widget/app_text_form_field.dart';
import 'package:social_media_app/feature/profile/bloc/profile_cubit.dart';
import 'package:social_media_app/core/custom_widget/app_button.dart';
import 'package:social_media_app/core/custom_widget/app_icon.dart';
import 'package:social_media_app/core/custom_widget/app_text.dart';
import 'package:social_media_app/config/route/app_route.dart';
import 'package:social_media_app/core/enum/dialog_types.dart';
import 'package:social_media_app/core/extension/context.dart';
import 'package:social_media_app/data/model/user_app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.userData});
  final UserApp userData;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> keyScaffold = GlobalKey<ScaffoldState>();
    return BlocProvider<ProfileCubit>(
      create: (contextB) => ProfileCubit(context: context, userApp: userData),
      child: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) async {
          switch (state.dialogsType) {
            case DialogsType.loading:
              await showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      content: SizedBox(
                        width: 40.w,
                        height: 20.h,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: context.theme.splashColor,
                          ),
                        ),
                      ),
                    ),
              ).whenComplete(() => context.read<ProfileCubit>().restDialog());
              break;

            case DialogsType.error:
              Navigator.pop(context);
              await showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      content: SizedBox(
                        width: 40.w,
                        height: 20.h,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(text: state.errorMassage),
                              AppButton(
                                onTap: () => Navigator.pop(context),
                                title: context.lang.ok,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              ).whenComplete(() => context.read<ProfileCubit>().restDialog());
              break;

            case DialogsType.successful:
              Navigator.pop(context);
            default:
          }
        },
        listenWhen:
            (previous, current) => previous.dialogsType != current.dialogsType,
        child: Scaffold(
          key: keyScaffold,
          body: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              children: [
                const _UserProfileAndName(),
                Expanded(
                  child: AddPostAndPostsView(
                    keyScaffold: keyScaffold,
                    fromProfile: true,
                    userApp: userData,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UserProfileAndName extends StatelessWidget {
  const _UserProfileAndName();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Container(
          height: state.isCurrentUserProfile ? 30.h : 35.h,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.theme.primaryColor,
                Colors.pink.shade200,
                context.theme.primaryColor,
              ],
            ),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 7.h,
                    backgroundColor: Colors.red.shade100,
                    backgroundImage:
                        state.localImage != null
                            ? FileImage(state.localImage!)
                            : (state.userApp.imagePerson != null
                                    ? NetworkImage(state.userApp.imagePerson!)
                                    : null)
                                as ImageProvider?,
                    child: Stack(
                      children: [
                        if (state.localImage == null &&
                            state.userApp.imagePerson == null)
                          Center(
                            child: AppIcon(icon: Icons.person, iconSize: 2.h),
                          ),
                        if (state.isCurrentUserProfile)
                          Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              onTap:
                                  () =>
                                      context
                                          .read<ProfileCubit>()
                                          .changeImageProfile(),
                              child: CircleAvatar(
                                radius: 2.5.h,
                                backgroundColor: Colors.white,
                                child: AppIcon(
                                  icon: Icons.edit,
                                  iconColor: context.theme.primaryColor,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  BlocSelector<ProfileCubit, ProfileState, bool>(
                    selector: (state) => state.isShowEditName,
                    builder: (context, isShowEditName) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            isShowEditName
                                ? SizedBox(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.75,
                                  child: AppTextField(
                                    textController: state.nameController,
                                  ),
                                )
                                : AppText(
                                  text: state.userApp.name,
                                  fontSize: 17.sp,
                                ),
                            if (state.isCurrentUserProfile)
                              IconButton(
                                onPressed:
                                    () =>
                                        context
                                            .read<ProfileCubit>()
                                            .changeName(),
                                icon: AppIcon(
                                  icon:
                                      isShowEditName ? Icons.done : Icons.edit,
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                  if (!state.isCurrentUserProfile)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoute.chatting,
                            arguments: [state.userApp],
                          );
                        },
                        child: CircleAvatar(
                          radius: 3.h,
                          backgroundColor: context.theme.primaryColor,
                          child: const AppIcon(
                            icon: Icons.chat_outlined,
                            iconColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: AppIcon(icon: Icons.arrow_back, iconSize: 2.5.w),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
