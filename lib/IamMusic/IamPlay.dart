import 'dart:math';

import 'package:dribble_1/IamMusic/CDCover.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class IamPlay extends StatefulWidget {
  IamPlay({Key key}) : super(key: key);

  @override
  _IamPlayState createState() => _IamPlayState();
}

class _IamPlayState extends State<IamPlay> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation animationOfBars;
  List<double> barH;
  int maxLine;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 223));
    _animationController.forward();
    //animationOfBars

    maxLine = 64;
    var currLine = 1;
    var r = Random();
    barH = [];
    do {
      var p = r.nextDouble();
      barH.add(p);
      currLine++;
    } while (currLine <= maxLine);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: LayoutBuilder(builder: (context, c) {
        return Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 32, top: 32),
              alignment: Alignment.topRight,
              child: Hero(
                tag: 'miracle',
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'The Miracle',
                        style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[50]),
                      ),
                      Text(
                        'Queen',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[50],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Hero(
              tag: 'playbar',
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: c.maxHeight * 0.86,
                  width: c.maxWidth,
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(128),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal,
                        blurRadius: 65,
                      )
                    ],
                  ),
                  child: LayoutBuilder(
                    builder: (_, cons) {
                      return Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            height: cons.maxHeight * 0.5,
                            //color: Colors.pinkAccent,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Container(
                                  constraints: c * .78,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.fromBorderSide(
                                      BorderSide(
                                        color: Colors.teal.withAlpha(100),
                                        width: 4,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  constraints: c * .7,
                                  child: AnimatedBuilder(
                                      animation: _animationController,
                                      builder: (context, child) {
                                        return Transform.rotate(
                                          angle: _animationController.value *
                                              pi *
                                              30,
                                          child: CD(
                                            image: 'assets/queen.jpg',
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: cons.maxHeight * .12,
                            //color: Colors.greenAccent,
                            child: LayoutBuilder(
                              builder: (context, cons) {
                                return Material(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Scandal',
                                        style: TextStyle(
                                            fontSize: cons.maxHeight*0.3,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        'The Miracle',
                                        style: TextStyle(
                                            fontSize: cons.maxHeight*0.17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        'Queen',
                                        style: TextStyle(
                                            fontSize: cons.maxHeight*0.17,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            ),
                          ),
                          Container(
                            height: cons.maxHeight * .08,
                            //color: Colors.red,
                            padding: EdgeInsets.only(left: 32, right: 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(Icons.list),
                                Icon(Icons.favorite_border),
                                Icon(Icons.add),
                              ],
                            ),
                          ),
                          Container(
                            height: cons.maxHeight * .08,
                            //color: Colors.lime,
                            padding: EdgeInsets.only(left: 32, right: 32),
                            child: AnimatedBuilder(
                                animation: _animationController,
                                builder: (context, child) {
                                  return LayoutBuilder(
                                    builder: (_, cons) {
                                      List<Widget> ws = [];
                                      double width = cons.maxWidth / maxLine;
                                      Color color;
                                      for (int i = 0; i < barH.length; i++) {
                                        if (_animationController.value <
                                            i / barH.length) {
                                          color = Colors.grey[400];
                                        } else {
                                          color = Colors.teal;
                                        }
                                        ws.add(
                                          Container(
                                            height:
                                                barH[i] * .8 * cons.maxHeight,
                                            width: width,
                                            decoration: BoxDecoration(
                                              color: color,
                                              border: Border.fromBorderSide(
                                                BorderSide(
                                                  color: Colors.grey[50],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      return Row(
                                        children: ws,
                                      );
                                    },
                                  );
                                }),
                          ),
                          Container(
                            height: cons.maxHeight * .03,
                            //color: Colors.indigo,
                            padding: EdgeInsets.only(left: 32, right: 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  '03.40',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .apply(),
                                ),
                                Text(
                                  '04.43',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .apply(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: cons.maxHeight * .14,
                            //color: Colors.lightBlue,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: cons.maxHeight,
                                  width: cons.maxWidth * .25,
                                  //color: Colors.redAccent,
                                  alignment: Alignment.center,
                                  child: Icon(Icons.shuffle),
                                ),
                                Container(
                                  height: cons.maxHeight,
                                  width: cons.maxWidth * .5,
                                  //color: Colors.amberAccent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.fast_rewind,
                                        size: 40,
                                      ),
                                      Icon(
                                        Icons.play_arrow,
                                        size: 84,
                                      ),
                                      Icon(
                                        Icons.fast_forward,
                                        size: 40,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: cons.maxHeight,
                                  width: cons.maxWidth * .25,
                                  //color: Colors.cyanAccent,
                                  alignment: Alignment.center,
                                  child: Icon(Icons.repeat),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
