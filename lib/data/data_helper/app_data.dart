import '../model/user_app.dart';
import 'dart:io';

class AppData {
  UserApp? _userApp;
  UserApp? get currentUser => _userApp;
  set setUser(UserApp userApp) {
    _userApp = userApp;
  }

  File? tempProfileImage;
}
