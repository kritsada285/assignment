String getWeekday(int day, int month, int year) {
  List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];

  if (month < 3) {
    year--; //decrease year for month Jan and Feb
    month += 12; //for Jan and Feb, month code will be 13 and 14
  }
  // otherwise : march to december month code is same as month

  // Apply Zeller's congruence
  double h = (day +
          (((month + 1) * 26) / 10).floor() +
          year +
          (year / 4).floor() +
          6 * (year / 100).floor() +
          (year / 400) -
          1) %
      7;
  return days[h.floor()];
}

// Returns true if
// given year is valid.
bool isLeap(int year) {
// Return true if year
// is a multiple of 4 and
// not multiple of 100.
// OR year is multiple of 400.
  return (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0));
}

bool isValidDate(int d, int m, int y) {
  // If year, month and day
  // are not in given range
  if (y < 1990) return false;
  if (m < 1 || m > 12) return false;
  if (d < 1 || d > 31) return false;

  // Handle February month
  // with leap year
  if (m == 2) {
    if (isLeap(y)) {
      return (d <= 29);
    } else {
      return (d <= 28);
    }
  }

  // Months of April, June,
  // Sept and Nov must have
  // number of days less than
  // or equal to 30.
  if (m == 4 || m == 6 || m == 9 || m == 11) return (d <= 30);

  return true;
}
