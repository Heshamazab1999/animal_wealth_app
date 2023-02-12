
import 'package:animal_wealth_app/util/images.dart';

import '../model/response/language_model.dart';

class AppConstants {
  static const String APP_NAME = 'Doctor Green';
  static const double APP_VERSION = 5.6;

  static const String BASE_URL = 'https://mypanel.ordery.shop';
  static const String CATEGORY_URI = '/api/v1/categories';

  // Shared Key
  static const String THEME = 'theme';
  static const String TOKEN = 'multivendor_token';
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String CART_LIST = 'cart_list';
  static const String USER_PASSWORD = 'user_password';
  static const String USER_ADDRESS = 'user_address';
  static const String USER_NUMBER = 'user_number';
  static const String USER_COUNTRY_CODE = 'user_country_code';
  static const String NOTIFICATION = 'notification';
  static const String SEARCH_HISTORY = 'search_history';
  static const String INTRO = 'intro';
  static const String NOTIFICATION_COUNT = 'notification_count';
  static const String TOPIC = 'all_zone_customer';
  static const String ZONE_ID = 'zoneId';
  static const String LOCALIZATION_KEY = 'X-localization';

  // Delivery Tips
  static List<int> tips = [0, 5, 10, 15, 20, 30, 50];

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: Images.english,
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: Images.arabic,
        languageName: 'عربى',
        countryCode: 'SA',
        languageCode: 'ar'),
  ];
}
