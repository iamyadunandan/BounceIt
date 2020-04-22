import 'dart:developer';
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
  List<String> _genres = ['assets/hiphop.jpg', 'assets/rock.jpg'];

  @override
  void initState() {
    super.initState();

    _pvController = PageController(
      viewportFraction: 0.6,
    );

    _anController = AnimationController(vsync: this);
    _pvController.addListener(
      () {
        if (_pvController.page.toInt() == _pvController.page) {
          _previousPage = _pvController.page.toInt();
        }
        _anController.value = _pvController.page - 0.3 - _previousPage;
        setState(() {
          _page = _pvController.page;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BACKGROUND,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Top',
                                    style: TextStyle(
                                      fontSize: constraints.maxHeight * 0.055,
                                    ),
                                  ),
                                  Text(
                                    'Albums',
                                    style: TextStyle(
                                      fontSize: constraints.maxHeight * 0.055,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: constraints.maxHeight * .84,
                              child: IamPageView(
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
                    color: Colors.blue,
                    child: LayoutBuilder(
                        builder: (context, BoxConstraints constraints) {
                      return Column(
                        children: <Widget>[
                          Container(
                            height: constraints.maxHeight * .2,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: pad * 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Music',
                                  style: TextStyle(
                                    fontSize: constraints.maxHeight * 0.075,
                                  ),
                                ),
                                Text(
                                  'Categories',
                                  style: TextStyle(
                                    fontSize: constraints.maxHeight * 0.075,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: constraints.maxHeight * .4,
                            color: Colors.lightGreen,
                            child: PageView.builder(
                              controller: PageController(viewportFraction: 0.8),
                              itemCount: 2,
                              itemBuilder: (context, i) {
                                return Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0, pad / 2, pad / 2, pad / 2),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(_genres[i]),
                                      ),
                                      color: Colors.grey[50],
                                      borderRadius: BorderRadius.circular(32)),
                                );
                              },
                            ),
                          ),
                          Container(
                            height: constraints.maxHeight * .4,
                            color: Colors.lime,
                          ),
                        ],
                      );
                    }),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
