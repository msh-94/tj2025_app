// lib/example/day04/pages/HomePage.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("더조은:웹"),),
      body: Text("홈 페이지"),
    );
  }
}