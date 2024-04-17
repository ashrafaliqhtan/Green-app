  import 'package:translator/translator.dart';

mixin AppLocale {
  static const String title = 'title';
  //sultan
  static const String homePage = 'homePage';
  static const String pointPage = 'pointPage'; //
  static const String eventPage = 'eventPage';
  static const String myEventPage = 'myEventPage';
  static const String initiativesTitle = 'initiativesTitle';
  static const String saudiGreenInitiatives = 'saudiGreenInitiatives';
  static const String nextEvent = 'nextEvent';
  static const String rewardsPage = 'rewardsPage'; //
  static const String historyPoint = 'historyPoint';
  static const String offers = 'offers';
  static const String currentPoint = 'currentPoint';
  static const String getPoint = 'getPoint';
  static const String usedPoint = 'usedPoint';
  static const String registerWithUs = 'registerWithUs';
  static const String login = 'login';
  static const String signup = 'signup';


  //profile
  static const String userName = 'jj';
  static const String account = 'account';
  static const String volunteerHours = 'volunteerHours';
  static const String hours = 'hours';
  static const String email = 'email';
  static const String city = 'city';
  static const String phoneNumber = 'kkk';
  static const String saveButton = 'save';
  static const String editTitle = 'edit';
  static const String SettingsTitle = 'Settings';
  static const String changePassword = 'changePassword';
  static const String changeEmail = 'changeEmail';
  static const String notification = 'notification';
  static const String darkMode = 'darkMode';
  static const String languageButton = 'language';
  static const String logoutButton = 'logout';
  static const String editProfile = 'editProfile';
  static const String chooseLanguage = 'chooseLanguage';
static const String listCity="listCity";

  static const Map<String, dynamic> EN = {
    chooseLanguage:"choose Language",
    userName:"user name",
    account: 'account',
    volunteerHours: 'volunteer Hours',
    hours: 'hours',
    email: 'email',
    city: 'city',
    phoneNumber: 'phone Number',
    saveButton: 'save',
    editTitle: 'edit',
    SettingsTitle: 'Settings',
    changePassword: 'change Password',
    changeEmail: 'change Email',
    notification: 'notification',
    darkMode: 'dark Mode',
    languageButton: 'language',
    logoutButton: 'logout',
    editProfile: 'edit Profile',
    listCity:[
     "Eastern",
     "Riyadh",
     "Makkah",
     "AL Madinah AL Munawwarah",
     "Al-Qassim",
     "Asir",
     "Tabuk",
     "Hail",
     "Northern borders",
     "Najran",
     "Al Baha",
     "Al-Jawf"
   ]
  };
  static const Map<String, dynamic> AR = {
    chooseLanguage: 'اختر اللغة',
    userName:"اسم المستخدم",
    account: 'حساب',
    volunteerHours: 'ساعات التطوع',
    hours: 'ساعات',
    email: 'البريد الإلكتروني',
    city: 'المدينة',
    phoneNumber: 'رقم الهاتف',
    saveButton: 'حفظ',
    editTitle: 'تعديل',
    SettingsTitle: 'الإعدادات',
    changePassword: 'تغيير كلمة المرور',
    changeEmail: 'تغيير البريد الإلكتروني',
    notification: 'الإشعارات',
    darkMode: 'الوضع الداكن',
    languageButton: 'اللغة',
    logoutButton: 'تسجيل الخروج',
    editProfile: 'تعديل الملف الشخصي',
    listCity:[
    "الشرقية",
    "الرياض",
    "مكة المكرمة",
    "المدينة المنورة",
    "القصيم",
    "عسير",
    "تبوك",
    "حائل",
    "الحدود الشمالية",
    "نجران",
    "الباحة",
    "الجوف"
  ]
  };
  translatorFunction(String input) {
  String statement="";
  final translator = GoogleTranslator();
  translator.translate(input, to: 'en').then((result) => statement=result.text);
  return statement;
  }


}

