import 'dart:convert';

import 'package:flutter/services.dart';


dynamic getJsonData(String file) async {
  final data = await rootBundle.loadString('assets/data/$file.json');
  return json.decode(data);
}