import 'package:dribble_1/IamMusic/CDCover.dart';
import 'package:flutter/material.dart';

class IamMiracle extends StatefulWidget {
  IamMiracle({Key key}) : super(key: key);

  @override
  _IamMiracleState createState() => _IamMiracleState();
}

class _IamMiracleState extends State<IamMiracle> {
  ValueNotifier _valueNotifier = ValueNotifier(Colors.teal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          LayoutBuilder(builder: (context, BoxConstraints cons) {
            return Container(
              padding: EdgeInsets.only(top: cons.maxHeight * 0.07),
              color: Colors.teal,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        right: cons.maxWidth * 0.3,
                        top: cons.maxHeight * .06,
                        left: cons.maxWidth * .08),
                    child: Hero(
                      flightShuttleBuilder: (flightContext, anim, direction,
                          fromContext, toContext) {
                        final Hero toHero = toContext.widget;
                        return RotationTransition(
                          turns: anim,
                          child: toHero,
                        );
                      },
                      tag: 'CD',
                      child: CD(
                        image: 'assets/queen.jpg',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: cons.maxWidth * 0.08),
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
                                color: Colors.grey[50],
                                fontSize: 42,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Queen',
                              style: TextStyle(
                                color: Colors.grey[50],
                                fontSize: 32,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          Container(
            child:
                LayoutBuilder(builder: (context, BoxConstraints constraints_1) {
              return Column(
                children: <Widget>[
                  Container(
                    width: constraints_1.maxWidth,
                    height: constraints_1.maxHeight * .3,
                  ),
                  Hero(
                    flightShuttleBuilder:
                        (fliContext, anim, direc, fromContext, toContext) {
                      return AnimatedBuilder(
                        animation: anim,
                        builder: (context, child) {
                          return LayoutBuilder(
                              builder: (context, BoxConstraints cons) {
                            return Stack(
                              children: <Widget>[
                                OverflowBox(
                                  maxHeight: cons.maxHeight * 1,
                                  child: Container(
                                    height: (MediaQuery.of(context)
                                                .size
                                                .height *
                                            anim.value) +
                                        MediaQuery.of(context).size.height * .3,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                          150 * anim.value,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                OverflowBox(
                                  maxHeight: (MediaQuery.of(context)
                                              .size
                                              .height *
                                          anim.value) +
                                      MediaQuery.of(context).size.height * .3,
                                  child: Container(
                                    height: (MediaQuery.of(context)
                                                .size
                                                .height *
                                            anim.value) +
                                        MediaQuery.of(context).size.height * .3,
                                    //color: Colors.pinkAccent,
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: constraints_1.maxHeight * .4,
                                      width: constraints_1.maxWidth,
                                      color: Colors.grey[100],
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            child: Icon(
                                              Icons.favorite_border,
                                              size: cons.maxWidth * 0.1,
                                            ),
                                            padding: EdgeInsets.all(
                                              cons.maxWidth * 0.06,
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.teal,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16),
                                                    bottomRight:
                                                        Radius.circular(16))),
                                            height: 50,
                                            width: 65,
                                            alignment: Alignment.center,
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.grey[50],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                        },
                      );
                    },
                    tag: 'miraclecard' + 0.toString(),
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: constraints_1.maxHeight * .56,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(150),
                        ),
                      ),
                      child: LayoutBuilder(builder: (context, constraints_2) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: constraints_2.maxHeight * .8,
                              child: queenAlbum(context),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                  AnimatedBuilder(
                      animation: _valueNotifier,
                      builder: (context, child) {
                        return Container(
                          color: Colors.grey[100],
                          height: constraints_1.maxHeight * .14,
                          child: LayoutBuilder(
                            builder: (_, BoxConstraints cons) {
                              return Stack(
                                alignment: Alignment.bottomLeft,
                                children: <Widget>[
                                  Container(
                                    width: cons.maxWidth,
                                    height: cons.maxHeight * .7,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(84),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomRight,
                                        stops: [0.1, 0.2, 0.7],
                                        colors: [
                                          _valueNotifier.value,
                                          _valueNotifier.value.withAlpha(100),
                                          _valueNotifier.value.withAlpha(0)
                                        ],
                                      ),
                                    ),
                                    alignment: Alignment.bottomCenter,
                                    child: LayoutBuilder(
                                      builder: (_, BoxConstraints c) {
                                        return Hero(
                                          tag: 'playbar',
                                          child: Container(
                                            alignment: Alignment.bottomCenter,
                                            height: c.maxHeight * .94,
                                            width: c.maxWidth,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                  84,
                                                ),
                                              ),
                                            ),
                                            child: Container(
                                              height: c.maxHeight * 0.8,
                                              alignment: Alignment.topCenter,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    'Bohemian Rhapsody',
                                                    style: TextStyle(
                                                      fontSize:
                                                          c.maxHeight * 0.2,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    'By Queen',
                                                    style: TextStyle(
                                                      fontSize:
                                                          c.maxHeight * 0.14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.only(
                                      left: constraints_1.maxWidth * 0.06,
                                    ),
                                    width: cons.maxWidth,
                                    height: cons.maxHeight,
                                    //color: Colors.purple.withAlpha(200),
                                    child: Container(
                                      height: cons.maxHeight * 0.6,
                                      width: cons.maxHeight * 0.6,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: _valueNotifier.value,
                                              blurRadius: 16)
                                        ],
                                        shape: BoxShape.circle,
                                        color: _valueNotifier.value,
                                      ),
                                      child: Icon(
                                        Icons.play_arrow,
                                        size: cons.maxHeight * 0.4,
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
            }),
          ),
        ],
      ),
    );
  }

  queenAlbum(context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 8),
              height: constraints.maxHeight * .25,
              //color: Colors.blue,
              child: Row(
                children: <Widget>[
                  Chip(
                    label: Row(
                      children: <Widget>[
                        Icon(Icons.shuffle),
                        Text('Shuffle play'),
                      ],
                    ),
                  ),
                  Container(
                    width: 4,
                  ),
                  Chip(
                    label: Row(
                      children: <Widget>[
                        Icon(Icons.play_arrow),
                        Text('Play all'),
                      ],
                    ),
                  ),
                  Container(
                    width: 4,
                  ),
                  Chip(
                    label: Row(
                      children: <Widget>[
                        Icon(Icons.favorite),
                      ],
                    ),
                  ),
                  Container(
                    width: 4,
                  ),
                  Chip(
                    label: Row(
                      children: <Widget>[
                        Icon(Icons.add),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: constraints.maxHeight * 0.75,
              //color: Colors.green,
              padding: EdgeInsets.only(top: 16),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Text(
                          '#',
                          style: Theme.of(context).textTheme.caption.apply(),
                        ),
                      ),
                      Flexible(
                        flex: 8,
                        child: Text(
                          'Title',
                          style: Theme.of(context).textTheme.caption.apply(),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Text(
                          'Duration',
                          style: Theme.of(context).textTheme.caption.apply(),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Text(
                          'Like it',
                          style: Theme.of(context).textTheme.caption.apply(),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Text(
                          'Add to',
                          style: Theme.of(context).textTheme.caption.apply(),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Text(
                          '1',
                          style: Theme.of(context).textTheme.caption.apply(),
                        ),
                      ),
                      Flexible(
                        flex: 8,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed('/play');
                          },
                          child: Text(
                            'Scandal',
                            style: Theme.of(context).textTheme.caption.apply(),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Text(
                          '04:43',
                          style: Theme.of(context).textTheme.caption.apply(),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.teal,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Icon(
                          Icons.add,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
