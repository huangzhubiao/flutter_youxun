import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:youxun/util/NetUtils.dart';
import 'package:youxun/models/article.dart';

import 'package:youxun/redux/states/main.dart';
import 'package:youxun/redux/view_models/home.dart';

class MyInfoPage extends StatefulWidget{
  _MyInfoPageState createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage>{

int sliderIndex = 0;
  @override
  void initState() {
    super.initState();
    Networking.fetchtSchedule();
    Networking.fetchArticles();
    Networking.fetchBanners();
    Networking.fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body:StoreConnector<ReduxState, HomeViewModel>(
          converter: (store) => HomeViewModel(store),
          builder: (context, vm) {
            return new Container(
              child: vm.isLoading?Center(
                child: CircularProgressIndicator(),
              ):Container(
                child: vm.articles.isNotEmpty?ListView.builder(
                  itemCount:vm.articles.length,
                  itemBuilder:(context,index){
                    return new Text('${vm.articles[index].url}');
                  }
                ):Container(),
              ),
            );
            return new Text('123+++ 789 ${vm.articles[0].url}');


          })
    );
  }

}