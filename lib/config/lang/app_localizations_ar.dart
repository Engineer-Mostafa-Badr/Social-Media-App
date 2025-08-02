// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get email => 'البريد الالكتروني';

  @override
  String get password => 'كلمه السر';

  @override
  String get notHaveAccount => 'لا يوجد لديك حساب ! ';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String emty(String value) {
    return '$value لا يمكن ان يكون فارغ';
  }

  @override
  String get emailFormat => 'البريد الالكتروني غير صحيح';

  @override
  String get passwordFormat =>
      'كلمه السر يجب ان تحتوي على حروف كبيرة وصغيرة ورقم ورمز خاص';

  @override
  String get noInternetAccess => 'لا يوجد اتصال بالانترنت';

  @override
  String get notUserFoundFirebase =>
      'لا يوجد مستخدم مرتبط بهذا البريد الالكتروني.';

  @override
  String get errorPasswordFirebase => 'كلمه السر خاطئه لهذا المستخدم.';

  @override
  String get errorFirebase => 'حدث خطأ ما ، يرجى المحاولة مرة أخرى لاحقًا.';

  @override
  String get noDataExist => 'لا توجد بيانات للوثيقة المطلوبة.';

  @override
  String get ok => 'حسنا';

  @override
  String get male => 'ذكر';

  @override
  String get female => 'أنثى';

  @override
  String get emailIsExist => 'البريد الإلكتروني موجد بالفعل';

  @override
  String get addPost => 'إضافة منشور ...';

  @override
  String get viewProfile => 'زيارة الملف الشحصي';

  @override
  String get lang => 'اللغة';

  @override
  String get theme => 'السمة';

  @override
  String get signOut => 'تسجيل الخروج';

  @override
  String get addNewPost => 'إضافة منشور جديد';

  @override
  String get post => 'نشر';

  @override
  String get cancel => 'إلغاء';

  @override
  String get comment => 'تعليق';

  @override
  String get commentHint => 'أضف تعليق ...';

  @override
  String get noImage => 'لا يوجد صور';

  @override
  String get typingMassage => 'ادخل الرسالة';

  @override
  String get send => 'إرسال';
}
