import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';

class DateFormatter {
  static String formatRelative(DateTime dateTime, BuildContext context) {
    final now = DateTime.now();

    final fixedDate = DateTime.utc(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      dateTime.hour,
      dateTime.minute,
      dateTime.second,
      dateTime.millisecond,
      dateTime.microsecond,
    ).toLocal();

    final isFuture = fixedDate.isAfter(now);
    final diff = isFuture
        ? fixedDate.difference(now)
        : now.difference(fixedDate);
    if (diff.inSeconds < 60) {
      return LocaleKeys.time_just_now.tr();
    }

    if (diff.inMinutes < 60) {
      if (isFuture) {
        return diff.inMinutes == 1
            ? LocaleKeys.time_in_minute.tr()
            : LocaleKeys.time_in_minutes.tr(
                namedArgs: {'count': diff.inMinutes.toString()},
              );
      } else {
        return diff.inMinutes == 1
            ? LocaleKeys.time_minute_ago.tr()
            : LocaleKeys.time_minutes_ago.tr(
                namedArgs: {'count': diff.inMinutes.toString()},
              );
      }
    }

    if (diff.inHours < 24) {
      if (isFuture) {
        if (diff.inHours == 1) return LocaleKeys.time_in_hour.tr();
        if (diff.inHours == 2) return LocaleKeys.time_in_two_hours.tr();
        return LocaleKeys.time_in_hours.tr(
          namedArgs: {'count': diff.inHours.toString()},
        );
      } else {
        if (diff.inHours == 1) return LocaleKeys.time_hour_ago.tr();
        if (diff.inHours == 2) return LocaleKeys.time_two_hours_ago.tr();
        return LocaleKeys.time_hours_ago.tr(
          namedArgs: {'count': diff.inHours.toString()},
        );
      }
    }

    final yesterday = now.subtract(const Duration(days: 1));
    final tomorrow = now.add(const Duration(days: 1));

    if (!isFuture &&
        dateTime.year == yesterday.year &&
        dateTime.month == yesterday.month &&
        dateTime.day == yesterday.day) {
      return LocaleKeys.time_yesterday.tr();
    }

    if (isFuture &&
        dateTime.year == tomorrow.year &&
        dateTime.month == tomorrow.month &&
        dateTime.day == tomorrow.day) {
      return LocaleKeys.time_tomorrow.tr();
    }

    final format = DateFormat(
      'dd/MM/yy',
      Localizations.localeOf(context).languageCode,
    );

    return format.format(dateTime);
  }
}
