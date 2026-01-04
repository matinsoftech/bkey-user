import 'package:bkey_user/services/storage_services.dart';

class OnboardingManager {
  static const _key = 'onboarding_shown';

  static Future<void> setShown() async {
    await StorageService.setBool(_key, true);
  }

  static bool isShown() {
    return StorageService.getBool(_key, defaultValue: false);
  }
}
