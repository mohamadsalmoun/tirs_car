import 'dart:ui';
import 'package:flutter/material.dart';


class AppConfig {

  static const String MAIN_API_URL = "https://trscar.com/api/";

  static setHeader() {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': "",
      'x-api-key': 'mwDA9w',
      'Content-Language': 'ar',
      'Content-Country': '1',
    };
    return header;
  }

  static Widget noDataWidget() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Center(
          child: Text('No data available.',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF415094),
              ))),
    );
  }

}
final primaryColor = Color(0xFF484848);
final backgroundColor = Color(0xfff6f6f6);
final accentColor = Color(0xffE02B20);
