import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static String of(BuildContext context, String key) {
    return Intl.message(
      key,
      name: key,
      desc: 'Description for $key',
      locale: Localizations.localeOf(context).toString(),
    );
  }
}
