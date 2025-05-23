String formatTime(DateTime date) {
  String year = date.year.toString();
  String month = date.month.toString().padLeft(2, '0');
  String day = date.day.toString().padLeft(2, '0');

  int hour = date.hour;
  int minute = date.minute;
  String meridiem = hour >= 12 ? 'PM' : 'AM';

  int hour12 = hour % 12 == 0 ? 12 : hour % 12;
  String hourStr = hour12.toString();
  String minuteStr = minute.toString().padLeft(2, '0');

  return '$day-$month-$year $hourStr:$minuteStr $meridiem';
}
