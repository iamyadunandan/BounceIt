import 'package:flutter/material.dart';

import 'IamMusic/IamMusic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IamMusic(),
    );
  }
}

class IamTemp extends StatefulWidget {
  IamTemp({Key key}) : super(key: key);

  @override
  _IamTempState createState() => _IamTempState();
}

class _IamTempState extends State<IamTemp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context,BoxConstraints cons){
          return Column(
            children: <Widget>[
              Container(
                height: cons.maxHeight*0.13,
                width: cons.maxWidth,
              ),
              Container(
                height: cons.maxHeight*0.47,
                width: cons.maxWidth,
              ),
              Container(
                height: cons.maxHeight*0.4,
                width: cons.maxWidth,
              ),
            ],
          );
        },
      ),
    );
  }
}
