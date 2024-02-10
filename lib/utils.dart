import 'dart:core';

int findMaxConsecutiveChars(String input, String charToFind) {
  RegExp regExp = RegExp('(${RegExp.escape(charToFind)})\\1*');
  List<int> matches = regExp.allMatches(input).map((e) => e[0]!.length).toList();
  matches.sort();
  return matches.last;
}