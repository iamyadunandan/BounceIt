import 'dart:developer';
import 'dart:math';
import 'dart:typed_data';

import 'package:dribble_1/IamMusic/CDCover.dart';
import 'package:dribble_1/IamMusic/MyPages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'IamPageView.dart';

class IamMusic extends StatefulWidget {
  IamMusic({Key key}) : super(key: key);

  @override
  _IamMusicState createState() => _IamMusicState();
}

class _IamMusicState extends State<IamMusic>
    with SingleTickerProviderStateMixin {
  Color BACKGROUND_GREEN = Colors.green;
  Color BACKGROUND = Colors.grey[50];
  Color TRANPERENT = Colors.transparent;
  PageController _pvController;
  AnimationController _anController;
  double maxScroll, minScroll, eachScroll;
  List<double> pages = [0.0, 0.0, 0.0];
  double _page = 0;
  int _previousPage = 0;
  List<String> _genresFiles = ['assets/hiphop.jpg', 'assets/rock.jpg'];
  List<String> _genres = ['HipHop', 'Rock'];
  List<Color> _genreColor = [
    Colors.red.withAlpha(150),
    Colors.blue.withAlpha(150)
  ];
  Tween<Color> _tween;
  Animation _animation;
  ValueNotifier<Color> _valueNotifier = ValueNotifier(Colors.teal);

  @override
  void initState() {
    super.initState();
    _anController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          child: Hero(
            flightShuttleBuilder:
                (flightContext, anim, direction, fromContext, toContext) {
              final Hero toHero = toContext.widget;
              return RotationTransition(
                turns: anim,
                child: toHero,
              );
            },
            tag: 'CD',
            child: CD(image: 'assets/queen.jpg'),
          ),
        ),
        Container(
          color: BACKGROUND,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.grey[100],
              body:
                  LayoutBuilder(builder: (context, BoxConstraints constraints) {
                var pad = constraints.maxWidth / 16;
                var iconSize = constraints.maxHeight * .035;

                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //menu and profile
                      Container(
                        height: constraints.maxHeight * 0.16,
                        child: LayoutBuilder(
                            builder: (context, BoxConstraints constraints) {
                          return Column(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: constraints.maxHeight * 0.15)),
                              Container(
                                height: constraints.maxHeight * 0.5,
                                padding: EdgeInsets.fromLTRB(pad, 0, pad, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Icon(
                                      Icons.menu,
                                      size: iconSize,
                                    ),
                                    Icon(
                                      Icons.person_outline,
                                      size: iconSize,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: constraints.maxHeight * 0.35,
                                margin: EdgeInsets.only(left: pad, right: pad),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[350],
                                      offset: Offset(0, 10),
                                      spreadRadius: 1,
                                      blurRadius: 25,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(32),
                                  color: BACKGROUND,
                                ),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 16),
                                  child: Icon(Icons.search),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                      Container(
                        height: constraints.maxHeight * .47,
                        padding: EdgeInsets.only(top: pad),
                        child: LayoutBuilder(
                            builder: (context, BoxConstraints constraints) {
                          return Container(
                            height: constraints.maxHeight,
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: constraints.maxHeight * .16,
                                  padding: EdgeInsets.only(
                                    left: pad * 2,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Top',
                                        style: TextStyle(
                                          fontSize:
                                              constraints.maxHeight * 0.055,
                                        ),
                                      ),
                                      Text(
                                        'Albums',
                                        style: TextStyle(
                                          fontSize:
                                              constraints.maxHeight * 0.055,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: constraints.maxHeight * .84,
                                  child: IamPageView(
                                    fn: (Color color) {
                                      _valueNotifier.value = color;
                                    },
                                    list: [0.0, 0.0, 0.0, 0.0],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                      Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * .37,
                        //color: Colors.blue,
                        child: LayoutBuilder(
                          builder: (context, BoxConstraints constraints) {
                            return Column(
                              children: <Widget>[
                                Container(
                                  height: constraints.maxHeight * .2,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: pad * 2),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Music',
                                        style: TextStyle(
                                          fontSize:
                                              constraints.maxHeight * 0.075,
                                        ),
                                      ),
                                      Text(
                                        'Categories',
                                        style: TextStyle(
                                          fontSize:
                                              constraints.maxHeight * 0.075,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: constraints.maxHeight * .4,
                                  //color: Colors.lightGreen,
                                  child: PageView.builder(
                                    pageSnapping: false,
                                    controller:
                                        PageController(viewportFraction: 0.65),
                                    itemCount: 2,
                                    itemBuilder: (context, i) {
                                      return Container(
                                        margin: EdgeInsets.fromLTRB(
                                          0,
                                          pad / 2,
                                          pad / 2,
                                          pad / 2,
                                        ),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(_genresFiles[i]),
                                            fit: BoxFit.fitWidth,
                                            colorFilter: ColorFilter.mode(
                                              _genreColor[i],
                                              BlendMode.darken,
                                            ),
                                          ),
                                          color: Colors.grey[50],
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        padding: EdgeInsets.fromLTRB(
                                            pad, 0, 0, pad / 2),
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          _genres[i],
                                          style: TextStyle(
                                            color: Colors.grey[50],
                                            fontWeight: FontWeight.w900,
                                            fontSize:
                                                constraints.maxHeight * .09,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                AnimatedBuilder(
                                    animation: _valueNotifier,
                                    builder: (context, child) {
                                      return Container(
                                        height: constraints.maxHeight * .4,
                                        child: LayoutBuilder(
                                          builder: (_, BoxConstraints cons) {
                                            return Stack(
                                              alignment: Alignment.bottomLeft,
                                              children: <Widget>[
                                                Container(
                                                  width: cons.maxWidth,
                                                  height: cons.maxHeight * .7,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight: Radius.circular(
                                                        84,
                                                      ),
                                                    ),
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topRight,
                                                      end:
                                                          Alignment.bottomRight,
                                                      stops: [0.1, 0.2, 0.7],
                                                      colors: [
                                                        _valueNotifier.value,
                                                        _valueNotifier.value
                                                            .withAlpha(100),
                                                        _valueNotifier.value
                                                            .withAlpha(0)
                                                      ],
                                                    ),
                                                  ),
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: LayoutBuilder(
                                                    builder:
                                                        (_, BoxConstraints c) {
                                                      return Container(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        height:
                                                            c.maxHeight * .94,
                                                        width: c.maxWidth,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Colors.grey[100],
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                              84,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Container(
                                                          height:
                                                              c.maxHeight * 0.8,
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Text(
                                                                'Bohemian Rhapsody',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      c.maxHeight *
                                                                          0.2,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                              Text(
                                                                'By Queen',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      c.maxHeight *
                                                                          0.14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  padding: EdgeInsets.only(
                                                      left: pad),
                                                  width: cons.maxWidth,
                                                  height: cons.maxHeight,
                                                  //color: Colors.purple.withAlpha(200),
                                                  child: Container(
                                                    height:
                                                        cons.maxHeight * 0.6,
                                                    width: cons.maxHeight * 0.6,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color:
                                                                _valueNotifier
                                                                    .value,
                                                            blurRadius: 16)
                                                      ],
                                                      shape: BoxShape.circle,
                                                      color:
                                                          _valueNotifier.value,
                                                    ),
                                                    child: Icon(
                                                      Icons.play_arrow,
                                                      size:
                                                          cons.maxHeight * 0.4,
                                                      color: Colors.grey[50],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    }),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
