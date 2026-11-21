class Holiday {
  final String name;
  final int day;
  final String month;

  Holiday(this.name, this.day, this.month);

  static bool inSameMonth(Holiday first, Holiday second) {
    return first.month.toLowerCase() == second.month.toLowerCase();
  }

  static double avgDate(List<Holiday> holidays) {
    if (holidays.isEmpty) {
      throw ArgumentError('At least one holiday is required.');
    }

    var totalDays = 0;
    for (final holiday in holidays) {
      totalDays += holiday.day;
    }
    return totalDays / holidays.length;
  }
}

void main() {
  final independenceDay = Holiday('Independence Day', 4, 'July');
  final canadaDay = Holiday('Canada Day', 1, 'July');
  final newYear = Holiday("New Year's Day", 1, 'January');

  print(Holiday.inSameMonth(independenceDay, canadaDay));
  print(Holiday.inSameMonth(independenceDay, newYear));
  print(Holiday.avgDate([independenceDay, canadaDay]));
}
