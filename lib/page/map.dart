import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';

class MyMap extends StatefulWidget {
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap>{
 String _bodyText = '点击效果';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('弹出菜单演示'),
      ),
      //这是屏幕主体包含一个中央空间，里面是一个文本内容以及字体大小
      body: new Center(
        child:new PopupMenuButton<String>(
              //这是点击弹出菜单的操作，点击对应菜单后，改变屏幕中间文本状态，将点击的菜单值赋予屏幕中间文本
              onSelected: (String value) {
                setState(() {
                  _bodyText = value;
                });
              },
              child: new Text("弹出"),
              //这是弹出菜单的建立，包含了两个子项，分别是增加和删除以及他们对应的值
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Text('增加'),
                          new Icon(Icons.add_circle)
                        ],
                      ),
                      value: '这是增加',
                    ),
                    PopupMenuItem(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Text('增加'),
                          new Icon(Icons.remove_circle)
                        ],
                      ),
                      value: '这是删除',
                    )
                  ])
      ),
    );
  }
}