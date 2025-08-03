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
  String get name => 'الإسم';

  @override
  String get gender => 'الجنس';

  @override
  String get birthDay => 'تاريخ الميلاد';

  @override
  String get notHaveAccount => 'لا يوجد لديك حساب ! ';

  @override
  String get haveAccount => ' يوجد لديك حساب ! ';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String empty(String value) {
    return '$value لا يمكن أن يكون فارغ';
  }

  @override
  String get emailFormat => 'البريد الالكتروني غير موجود.';

  @override
  String get passwordFormat =>
      'كلمة السر يجب أن تحتوي على حرف كبير وحرف صغير ورمز وأرقام وأن لا يقل طولها عن ٨ خانات.';

  @override
  String get noInternetAccess => 'لا يوجد اتصال بالانترنت.';

  @override
  String get notUserFoundFirebase =>
      'لا يوجد حساب لهذا البريد الإلكتروني أو كلمة السر غير صحيحة.';

  @override
  String get errorPasswordFirebase => 'خطأ في كلمة السر.';

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
