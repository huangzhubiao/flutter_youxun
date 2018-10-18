class AdvertShareData {

  String linkUrl;
  String linkTitle;
  String linkCoverPath;
  String linkContent;
  bool isExternalUrl;

  AdvertShareData({this.linkUrl, this.linkTitle, this.linkCoverPath, this.linkContent, this.isExternalUrl});

  AdvertShareData.fromJson(Map<String, dynamic> json) {
    linkUrl = json['linkUrl'];
    linkTitle = json['linkTitle'];
    linkCoverPath = json['linkCoverPath'];
    linkContent = json['linkContent'];
    isExternalUrl = json['isExternalUrl'];
  }
}