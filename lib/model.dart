// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

List<List<dynamic>> bookingModelFromJson(String str) =>
    List<List<dynamic>>.from(
        json.decode(str).map((x) => List<dynamic>.from(x.map((x) => x))));

String bookingModelToJson(List<List<dynamic>> data) => json.encode(
    List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x)))));
