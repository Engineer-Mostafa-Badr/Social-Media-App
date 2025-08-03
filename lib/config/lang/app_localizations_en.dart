// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get name => 'Name';

  @override
  String get gender => 'Gender';

  @override
  String get birthDay => 'Birth Day';

  @override
  String get notHaveAccount => 'Not have account ! ';

  @override
  String get haveAccount => 'Have account ! ';

  @override
  String get signUp => 'Sign Up';

  @override
  String empty(String value) {
    return '$value can not be empty';
  }

  @override
  String get emailFormat => 'Email format is not correct';

  @override
  String get passwordFormat =>
      'Password must be contains upper latter character and lower latter character and spacial character and numbers and must be at least 8 digits.';

  @override
  String get noInternetAccess => 'No internet connection';

  @override
  String get notUserFoundFirebase =>
      'No user found for that email or password not correct.';

  @override
  String get errorPasswordFirebase => 'Wrong password provided for that user.';

  @override
  String get errorFirebase => 'An error occurred , please try again later.';

  @override
  String get noDataExist => 'No data exists for the requested document.';

  @override
  String get ok => 'Ok';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get emailIsExist => 'The account already exists for that email.';

  @override
  String get addPost => 'Add post ...';

  @override
  String get viewProfile => 'View profile';

  @override
  String get lang => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get signOut => 'sign out';

  @override
  String get addNewPost => 'Add new post';

  @override
  String get post => 'post';

  @override
  String get cancel => 'Cancel';

  @override
  String get comment => 'Comment';

  @override
  String get commentHint => 'Add new comment ...';

  @override
  String get noImage => 'No image';

  @override
  String get typingMassage => 'Typing massage';

  @override
  String get send => 'Send';
}
