// ignore_for_file: file_names, unused_import, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Info {
  int id;
  int userId;
  String title;
  String body;

  Info({this.id, this.userId, this.title, this.body});

  Info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    body = json['body'];
  }
}

Future<List<Info>> GetAllInfo() async {
  var url = "https://jsonplaceholder.typicode.com/posts";
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    body = body["data"] as List;
    // body.map((e) => print(e));
    List<Info> info = [];
    body.forEach(
      (element) {
        info.add(Info.fromJson(element));
      },
    );
    return info;
  }
  return null;
}
