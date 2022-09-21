import 'package:flutter/material.dart';

AppBar CustomAppBar() => AppBar(
  //title: Text('title'),
  flexibleSpace: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xffFCB040), Color(0xffCF1D5C)]),
    ),
  ),
);
