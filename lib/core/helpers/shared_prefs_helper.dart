import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  static Future<void> setProfileReminderDismissedTime() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    await _prefs?.setInt('profile_reminder_dismissed_time', now);
  }

  static bool shouldShowProfileReminder() {
    final dismissedTime = _prefs?.getInt('profile_reminder_dismissed_time');

    if (dismissedTime == null) {
      return true;
    }

    final lastDismissed = DateTime.fromMillisecondsSinceEpoch(dismissedTime);
    final now = DateTime.now();
    final difference = now.difference(lastDismissed);

    return difference.inHours >= 24;
  }

  static Future<void> clearProfileReminderDismissed() async {
    await _prefs?.remove('profile_reminder_dismissed_time');
  }

  static Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  static Future<void> clear() async {
    await _prefs?.clear();
  }
}
