import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static const TextStyle imageHeader = TextStyle(
    // backgroundColor: Color.fromRGBO(30, 30, 30, 1.0),
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 18.0,
  );
  static const TextStyle imageBody = TextStyle(
    // backgroundColor: Color.fromRGBO(30, 30, 30, 1.0),
    overflow: TextOverflow.ellipsis,
    color: Colors.white,
    fontSize: 12.0,
  );
}
