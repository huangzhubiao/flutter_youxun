
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../widgets/myswiper.dart';

class MyMap extends StatefulWidget {
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap>{

  static const String routeName = '/material/tabs';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _allPages.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  // backgroundColor:Colors.white,
                  title: const Text('我的'),
                  pinned: true,
                  expandedHeight: 280.0,
                  forceElevated: innerBoxIsScrolled,
                  bottom: PreferredSize(
                      child: new Container(
                        child: new TabBar(
                          indicatorColor: Colors.red,
                          indicatorWeight: 5.0,
                          tabs: _allPages.keys
                              .map(
                                (_Page page) => new Tab(
                                      child: new Tab(text: page.label),
                                    ),
                              )
                              .toList(),
                        ),
                        color: Colors.grey,
                        
                      ),
                      preferredSize: new Size(double.infinity, 46.0)
                      ),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: new HomeBanner(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: _allPages.keys.map((_Page page) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<_Page>(page),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0,
                          ),
                          sliver: SliverFixedExtentList(
                            itemExtent: _CardDataItem.height,
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                final _CardData data = _allPages[page][index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                  ),
                                  child: _CardDataItem(
                                    page: page,
                                    data: data,
                                  ),
                                );
                              },
                              childCount: _allPages[page].length,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}



const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class _Page {
  _Page({ this.label });
  final String label;
  String get id => label[0];
  @override
  String toString() => '$runtimeType("$label")';
}

class _CardData {
  const _CardData({ this.title, this.imageAsset, this.imageAssetPackage });
  final String title;
  final String imageAsset;
  final String imageAssetPackage;
}

final Map<_Page, List<_CardData>> _allPages = <_Page, List<_CardData>>{
  _Page(label: 'HOME'): <_CardData>[
    const _CardData(
      title: 'Flatwear',
      imageAsset: 'images/ic_nav_my_normal.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Pine Table',
      imageAsset: 'images/table.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Blue Cup',
      imageAsset: 'images/cup.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Tea Set',
      imageAsset: 'images/teaset.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Desk Set',
      imageAsset: 'images/deskset.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Blue Linen Napkins',
      imageAsset: 'images/napkins.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Planters',
      imageAsset: 'images/planters.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Kitchen Quattro',
      imageAsset: 'images/kitchen_quattro.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Platter',
      imageAsset: 'images/platter.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
  ],
  _Page(label: 'APPAREL'): <_CardData>[
    const _CardData(
      title: 'Cloud-White Dress',
      imageAsset: 'images/dress.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Ginger Scarf',
      imageAsset: 'images/scarf.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Blush Sweats',
      imageAsset: 'images/sweats.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
  ],
};

class _CardDataItem extends StatelessWidget {
  const _CardDataItem({ this.page, this.data });

  static const double height = 272.0;
  final _Page page;
  final _CardData data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: page.id == 'H'
                ? Alignment.centerLeft
                : Alignment.centerRight,
              child: CircleAvatar(child: Text('${page.id}')),
            ),
            SizedBox(
              width: 144.0,
              height: 144.0,
              child: Image.asset(
                // 'images/ic_nav_my_normal.png',
                data.imageAsset,
                // package: data.imageAssetPackage,
                fit: BoxFit.contain,
              ),
            ),
            Center(
              child: Text(
                data.title,
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}