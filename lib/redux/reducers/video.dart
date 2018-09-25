import 'package:redux/redux.dart';
import '../../models/help.dart';
import 'package:flutter/foundation.dart';
import '../../models/video_comment.dart';
import '../../models/video_info.dart';
import '../acitons/dynamic.dart';

VideoState videoReducer(VideoState state, action) {
  if (action is UpdateVideoInfo) {
    return state.copyWith(videoInfo: action.payload);
  }
  if (action is UpdateVideoComments) {
    return state.copyWith(videoComments: action.payload);
  }
  return state;
}

@immutable
class VideoState {
  final List<VideoComment> videoComments;
  final VideoInfo videoInfo;

  VideoState({
    this.videoInfo,
    this.videoComments,
  });

  VideoState copyWith(
      {VideoInfo videoInfo,
      List<Help> helps,
      List<VideoComment> videoComments}) {
    return VideoState(
        videoInfo: videoInfo ?? this.videoInfo,
        videoComments: videoComments ?? this.videoComments);
  }

  VideoState.initialState()
      : videoInfo = VideoInfo.initialState(),
        videoComments = [];
}

class VideoViewModel {
  final Store<VideoState> store;

  VideoViewModel(this.store);
  List<Help> get helps => this.store.state.videoInfo.helpList;
  List<VideoComment> get videoComments => this.store.state.videoComments;

  VideoInfo get videoInfo => this.store.state.videoInfo;
  List<SeasonList> get seasons => this.store.state.videoInfo.seasonList;
  String get title => videoInfo.resourceInfo?.cnname;
  String get cover => videoInfo.resourceInfo?.poster;
}
