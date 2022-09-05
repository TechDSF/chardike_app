
import 'package:meta/meta.dart';
import 'dart:convert';

List<int> itemIdModelFromJson(String str) => List<int>.from(json.decode(str).map((x) => x));

String itemIdModelToJson(List<int> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
