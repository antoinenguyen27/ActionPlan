import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

List<double> extractLatLong(String input) {
  // Regular expression to match doubles in the string
  RegExp regExp = RegExp(r'(-?\d+(\.\d+)?)');

  // Finding all matches in the input string
  Iterable<RegExpMatch> matches = regExp.allMatches(input);

  // Converting the matches to doubles and returning them as a list
  return matches.map((m) => double.parse(m.group(0)!)).toList();
}
