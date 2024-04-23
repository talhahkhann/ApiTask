// https://hp-api.onrender.com/api/characters

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var data;
Future<void> getUserApi() async {
  final response =
      await http.get(Uri.parse('https://hp-api.onrender.com/api/characters'));
  if (response.statusCode == 200) {
    data = jsonDecode(response.body.toString());
  } else {}
}
