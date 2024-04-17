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

  //Admin
  static const String controlPanel = 'ControlPanel';
  static const String eventsAdmin = 'Events';
  static const String supervisors = 'Supervisors';
  static const String rewardsPageAdmin = 'Rewards';
  static const String addressAdminEvent = 'Address';
  static const String supervisorsName = 'Name';
  static const String addImageEvent = 'AddImage';
  static const String eventName = 'EventName';
  static const String addDescription = 'AddDescription';
  static const String date = 'Date';
  static const String from = 'From';
  static const String to = 'To';
  static const String location = 'location';
  static const String maximumCapacity = 'maximumCapacity';
  static const String addIt = 'Add';
  static const String cancel = 'Cancel';
  static const String delete = 'Delete';
  static const String rewordName = 'RewordName';
  static const String supervisorsCity = 'City';
  static const String time = 'Time';

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
  static const String listCity = "listCity";
  static const String addEvent = "AddEvent";

  static const Map<String, dynamic> EN = {
    chooseLanguage: "choose Language",
    userName: "user name",
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
    controlPanel: 'Control Panel',
    eventsAdmin: 'Events',
    supervisors: 'Supervisors',
    rewardsPageAdmin: 'Rewards',
    addressAdminEvent: 'Address',
    supervisorsName: 'Name',
    addImageEvent: 'Add Image',
    eventName: 'Event Name',
    rewordName: 'Event Name',
    addDescription: 'Add Description',
    date: 'Date',
    time: 'Time',
    from: 'From',
    to: 'To',
    location: 'location',
    maximumCapacity: 'maximumCapacity',
    addIt: 'Add',
    cancel: 'Cancel',
    delete: 'Delete',
    supervisorsCity: 'City',
    addEvent: "Add Event",
  };
  static const Map<String, dynamic> AR = {
    chooseLanguage: 'اختر اللغة',
    time: 'الوقت',
    userName: "اسم المستخدم",
    rewordName: 'إسم المكآفأة',
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
    controlPanel: 'لوحة التحكم',
    supervisorsCity: 'المدينة',
    eventsAdmin: 'الأحداث',
    supervisors: 'المشرفون',
    rewardsPageAdmin: 'المكافآت',
    addressAdminEvent: 'العنوان',
    supervisorsName: 'الإسم',
    addImageEvent: 'أضف صورة الغلاف',
    eventName: 'إسم الحدث',
    addDescription: 'أضف وصف',
    date: 'التاريخ',
    from: 'من',
    to: 'الى',
    location: 'الموقع',
    maximumCapacity: 'القدرة الإستيعابية',
    addIt: 'أضف',
    cancel: 'إلغاء',
    delete: 'حذف',
    addEvent: "أضف حدث",
  };
  translatorFunction(String input) {
    String statement = "";
    final translator = GoogleTranslator();
    translator
        .translate(input, to: 'en')
        .then((result) => statement = result.text);
    return statement;
  }
}
