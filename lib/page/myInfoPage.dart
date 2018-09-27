import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:youxun/util/NetUtils.dart';
import 'package:youxun/models/article.dart';
import 'package:youxun/widgets/article_view.dart';
import 'package:youxun/widgets/home_banner.dart';
import 'package:youxun/widgets/section_title.dart';
import 'package:youxun/redux/states/main.dart';
import 'package:youxun/redux/view_models/home.dart';
import 'package:youxun/widgets/todays_boardcast.dart';
import 'package:youxun/widgets/secton_divider.dart';

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
      appBar: new AppBar(
        title:new Text('我的'),
      ),
      body:StoreConnector<ReduxState, HomeViewModel>(
          converter: (store) => HomeViewModel(store),
          builder: (context, vm) {
            return new Container(
              child: vm.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                      child: ListView(
                          primary: true,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: vm.ads.isNotEmpty
                                  ? HomeBanner(
                                      banners: vm.ads,
                                    )
                                  : Container(),
                            ),
                            SectionTitle(
                              title: "今日播出",
                            ),
                             Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: vm.schedules.isNotEmpty
                                  ? TodaysBoardcast(
                                      schedules: vm.schedules,
                                    )
                                  : Container(),
                            ),
                            SectionDivider(),
                            vm.articles.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    itemCount: vm.articles.length,
                                    itemBuilder: (context, index) {
                                      return ArticleView(
                                        vm: ArticleViewModel
                                            .fromArticle(vm.articles[index]),
                                      );
                                    },
                                  )
                                : Container(),
                          
                          ]),
                    ),
            );

          })
    );
  }

}