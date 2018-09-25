import 'package:flutter/foundation.dart';
import 'dynamic.dart';
import 'home.dart';
import 'lib.dart';
import 'profile.dart';
import 'rank.dart';
import 'search.dart';

@immutable
class ReduxState {
  final HomeState home;
  final RankState rank;
  final LibState lib;
  final SearchState search;
  final DynamicState dynamics;
  final ProfileState profile;

  const ReduxState(
      {this.home,
      this.rank,
      this.lib,
      this.search,
      this.dynamics,
      this.profile});
}
