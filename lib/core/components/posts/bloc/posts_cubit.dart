import 'package:social_media_app/data/repository/firebase_database.dart';
import 'package:social_media_app/core/enum/dialog_types.dart';
import 'package:social_media_app/data/model/post_model.dart';
import 'package:social_media_app/data/model/result_api.dart';
import 'package:social_media_app/data/model/user_app.dart';
import 'package:equatable/equatable.dart';
import '../../../enum/navigat_post.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final FirebaseDataBase firebaseDataBase;
  final BuildContext context;
  final bool fromProfile;
  final UserApp? userApp;
  PostsCubit({
    required this.firebaseDataBase,
    required this.context,
    required this.fromProfile,
    required this.userApp,
  }) : super(const PostsState()) {
    getListPost(formConstructor: true);
  }
  void navigatePost(NavigatePost navigatePost, {PostModel? post}) {
    if (isClosed) return;
    emit(state.copyWith(navigatePost: navigatePost, postEdit: post));
  }

  Future<void> getListPost({bool formConstructor = false}) async {
    if (isClosed) return;
    if (!formConstructor) {
      emit(state.copyWith(getPostState: DialogsType.loading));
    }

    ResultApi result = await firebaseDataBase.getMultiData(
      collection: 'post',
      context: context,
      userId: userApp?.idUser,
    );
    if (isClosed) return;
    if (result.isError) {
      emit(
        state.copyWith(
          getPostState: DialogsType.error,
          errorMassage: result.value,
        ),
      );
    } else {
      emit(
        state.copyWith(
          posts: List.from(result.value),
          getPostState: DialogsType.successful,
        ),
      );
    }
  }

  void removePostFromId(String id) {
    if (isClosed) return;
    final posts = List<PostModel>.from(state.posts);
    posts.removeWhere((element) => element.idPost == id);
    emit(state.copyWith(posts: posts));
  }

  void addNewPost(PostModel post) {
    if (isClosed) return;
    final posts = List<PostModel>.from(state.posts);
    posts.add(post);
    emit(state.copyWith(posts: posts));
  }

  void editPost(PostModel post) {
    if (isClosed) return;
    final posts = List<PostModel>.from(state.posts);
    posts.removeWhere((element) => element.idPost == post.idPost);
    posts.add(post);
    emit(state.copyWith(posts: posts));
  }

  void restNavigatorPost() {
    if (isClosed) return;
    emit(state.copyWith(navigatePost: NavigatePost.inti));
  }
}
