import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  MyPage({this.child, this.value,this.myValue,this.maxPadding, Key key})
      : super(key: key);
  final Widget child;
  final double value;
  final double myValue;
  final EdgeInsets maxPadding;

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.maxPadding*(widget.myValue-widget.value).abs(),
      child: widget.child,
    );
  }
}
