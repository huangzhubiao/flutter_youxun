import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:youxun/page/myInfoPage.dart';
import 'package:youxun/page/newListPage.dart';
import 'package:youxun/page/rank.dart';

import 'package:redux/redux.dart';
import 'package:youxun/redux/states/main.dart';
import 'package:youxun/redux/view_models/main.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:youxun/page/map.dart';




// void main() => runApp(new MyOSCClient());

void main() {
  final Store<ReduxState> store = StoreContainer.global;
  runApp(MyOSCClient(store: store));
}

class MyOSCClient extends StatefulWidget {
  final Store<ReduxState> store;
  MyOSCClient({this.store});

  @override
  State<StatefulWidget> createState() => new MyApp(store:store);
}

class MyApp extends State<MyOSCClient> {
  final Store<ReduxState> store;
  MyApp({this.store});
    int _tabIndex = 0;
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));
  final tabTextStyleSelected = new TextStyle(color: Colors.blue);

  var tabImages;
  var _body;
  var appBarTitles = ['预影','资讯','排行','我的'];

  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ]
      ];
    }
    _body = new IndexedStack(
      children: <Widget>[
        
        // new MyInfoPage(),
        new MyInfoPage(),
        new NewsListPage(),
        new RankPage(),
        new MyMap()
      ],
      index: _tabIndex,
    );
  }

  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return new Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }
  @override
  Widget build(BuildContext context) {
    initData();

    return StoreProvider<ReduxState>(
      store: store,
      child:new MaterialApp(
      theme: new ThemeData(
          primaryColor: Colors.blue,
      ),
      home: new Scaffold(
        body: _body,
        bottomNavigationBar: new CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: getTabIcon(0),
                title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1),
                title: getTabTitle(1)),
            new BottomNavigationBarItem(
                icon: getTabIcon(2),
                title: getTabTitle(2)),
            new BottomNavigationBarItem(
                icon: getTabIcon(3),
                title: getTabTitle(3)),
          ],
          currentIndex: _tabIndex,
          onTap: (index) {
            setState((){
              _tabIndex = index;
              }
            );
          },
        ),
      ),
    ),
    );
  }
}

