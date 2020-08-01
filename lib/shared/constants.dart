import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo, width: 1.0)),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo, width: 2.5)),
);

BoxDecoration buttonDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: LinearGradient(colors: [Color.fromRGBO(143, 148, 251, 1), Color.fromRGBO(143, 148, 251, 0.6)]));
