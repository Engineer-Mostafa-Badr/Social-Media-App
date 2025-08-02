import 'package:social_media_app/core/components/posts/bloc/posts_cubit.dart';
import 'package:social_media_app/core/custom_widget/app_text_form_field.dart';
import 'package:social_media_app/data/repository/firebase_database.dart';
import 'package:social_media_app/data/api/firebase_database_api.dart';
import 'package:social_media_app/core/custom_widget/app_icon.dart';
import 'package:social_media_app/core/custom_widget/app_text.dart';
import 'package:social_media_app/data/data_helper/app_data.dart';
import 'package:social_media_app/core/enum/dialog_types.dart';
import 'package:social_media_app/config/route/app_route.dart';
import 'package:social_media_app/core/enum/navigat_post.dart';
import 'package:social_media_app/core/extension/context.dart';
import 'package:social_media_app/data/model/post_model.dart';
import 'package:social_media_app/core/extension/theme.dart';
import 'package:social_media_app/data/model/user_app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'components/view/single_post_template.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'widget/add_post.dart';
part 'widget/post_view.dart';

class AddPostAndPostsView extends StatelessWidget {
  const AddPostAndPostsView({
    super.key,
    required this.keyScaffold,
    this.fromProfile = false,
    this.userApp,
  });
  final GlobalKey<ScaffoldState> keyScaffold;
  final bool fromProfile;
  final UserApp? userApp;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsCubit>(
      create:
          (contextB) => PostsCubit(
            fromProfile: fromProfile,
            userApp: userApp,
            context: context,
            firebaseDataBase: FirebaseDataBase(FireBaseDatabaseApp()),
          ),
      child: Builder(
        builder: (context) {
          return BlocListener<PostsCubit, PostsState>(
            listener: (contextB, state) {
              switch (state.navigatePost) {
                case NavigatePost.addNewPost:
                case NavigatePost.editPost:
                  Navigator.pushNamed(
                    context,
                    AppRoute.addPost,
                    arguments: [
                      context.read<PostsCubit>(),
                      if (NavigatePost.editPost == state.navigatePost)
                        state.postEdit,
                    ],
                  ).whenComplete(
                    // ignore: use_build_context_synchronously
                    () => context.read<PostsCubit>().restNavigatorPost(),
                  );

                  break;
                default:
              }
            },
            listenWhen:
                (previous, current) =>
                    previous.navigatePost != current.navigatePost,
            child: Column(
              children: [
                if (userApp?.idUser ==
                        context.read<AppData>().currentUser!.idUser ||
                    userApp == null)
                  const _AddPost(),
                Expanded(child: _PostView(keyScaffold: keyScaffold)),
              ],
            ),
          );
        },
      ),
    );
  }
}
