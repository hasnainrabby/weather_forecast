import 'package:intl/intl.dart';

class ForecastUtil{
  static String AppId ="4dc1d2c42d32db59e9da5f10a8b207a0";

  static String getFormattedDate(DateTime dateTime){
    return DateFormat("EEE MMM d y").format(dateTime);
  }
}