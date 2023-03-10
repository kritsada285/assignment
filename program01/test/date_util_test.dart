

import 'package:flutter_test/flutter_test.dart';
import 'package:assignment/utils/date.dart';

void main() {
  test('Check min valid date is 1990 afterward', () {
    expect(isValidDate(1, 1, 1889),false,reason :"It should invalid");
  });
  test('Check invalid date with day', () {
    expect(isValidDate(111, 1, 1889),false,reason :"It should invalid");
  });
  test('Check invalid date with month', () {
    expect(isValidDate(11, 1111, 1889),false,reason :"It should invalid");
  });

  test('Check week day of 1 Jan 1990 is Monday', () {
    expect(getWeekday(1, 1, 1990),"Monday",reason :"It should be exactly Monday");
  });
}
