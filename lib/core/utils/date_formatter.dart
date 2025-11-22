import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';

class DateFormatter {
  static String formatRelative(DateTime dateTime, BuildContext context) {
    final now = DateTime.now();
    Duration diff;
    bool isFuture = false;

    if (dateTime.isAfter(now)) {
      diff = dateTime.difference(now);
      isFuture = true;
    } else {
      diff = now.difference(dateTime);
    }

    if (diff.inSeconds < 60) {
      return LocaleKeys.time_just_now.tr();
    }

    if (diff.inMinutes < 60) {
      return diff.inMinutes == 1
          ? LocaleKeys.time_minute_ago.tr()
          : LocaleKeys.time_minutes_ago.tr(
              namedArgs: {'count': diff.inMinutes.toString()},
            );
    }

    if (diff.inHours < 24) {
      if (diff.inHours == 1) return LocaleKeys.time_hour_ago.tr();
      if (diff.inHours == 2) return LocaleKeys.time_two_hours_ago.tr();
      return LocaleKeys.time_hours_ago.tr(
        namedArgs: {'count': diff.inHours.toString()},
      );
    }

    final yesterday = now.subtract(const Duration(days: 1));
    if (!isFuture &&
        dateTime.day == yesterday.day &&
        dateTime.month == yesterday.month &&
        dateTime.year == yesterday.year) {
      return LocaleKeys.time_yesterday.tr();
    }

    final format = DateFormat(
      'dd/MM/yy',
      Localizations.localeOf(context).languageCode,
    );

    return format.format(dateTime);
  }
}
