// To parse this JSON data, do
//
//     final messageList = messageListFromJson(jsonString);

import 'dart:convert';

List<List<dynamic>> messageListFromJson(String str) => List<List<dynamic>>.from(json.decode(str).map((x) => List<dynamic>.from(x.map((x) => x))));

String messageListToJson(List<List<dynamic>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x)))));
