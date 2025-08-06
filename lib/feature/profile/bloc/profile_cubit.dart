// ignore_for_file: use_build_context_synchronously
import 'package:social_media_app/data/data_helper/app_data.dart';
import 'package:social_media_app/core/enum/dialog_types.dart';
import 'package:social_media_app/data/model/user_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'dart:io';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UserApp userApp;
  final BuildContext context;

  ProfileCubit({required this.context, required this.userApp})
    : super(
        ProfileState(
          userApp: userApp,
          nameController: TextEditingController(),
          isCurrentUserProfile:
              userApp.idUser == context.read<AppData>().currentUser!.idUser,
          localImage: context.read<AppData>().tempProfileImage,
        ),
      );

  Future<void> changeImageProfile() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );
    if (filePickerResult != null) {
      String imagePath = filePickerResult.files.first.path!;
      File selectedImage = File(imagePath);

      context.read<AppData>().tempProfileImage = selectedImage;

      emit(state.copyWith(localImage: selectedImage));
    }
  }

  void onTapChangeName() {
    emit(
      state.copyWith(
        nameController: TextEditingController(text: state.userApp.name),
        isShowEditName: !state.isShowEditName,
      ),
    );
  }

  Future<void> changeName() async {
    if (state.isShowEditName) {
      String newName = state.nameController.text.trim();
      if (newName.isNotEmpty) {
        emit(state.copyWith(dialogsType: DialogsType.loading));
        UserApp userApp = state.userApp.copyWith(name: newName);
        context.read<AppData>().setUser = userApp;
        emit(
          state.copyWith(userApp: userApp, dialogsType: DialogsType.successful),
        );
      }
    }
    onTapChangeName();
  }

  void restDialog() {
    emit(state.copyWith(dialogsType: DialogsType.init, errorMassage: ''));
  }
}
