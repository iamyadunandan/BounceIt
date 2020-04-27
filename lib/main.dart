import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'IamMusic/IamMiracle.dart';
import 'IamMusic/IamMusic.dart';

import 'IamMusic/IamPlay.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails flutterErrorDetails){
    log(flutterErrorDetails.summary.toString(),stackTrace: flutterErrorDetails.stack,error: flutterErrorDetails.exception);
  };
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/miracle': (BuildContext context){
          return IamMiracle();
        },
        '/play': (BuildContext context){
          return IamPlay();
        },
      },
      home: IamMusic(),
    );
  }
}

