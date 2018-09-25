import '../states/main.dart';
import 'home.dart' as home;
import 'rank.dart' as rank;
import 'lib.dart' as lib;
import 'search.dart' as search;
import 'dynamic.dart' as dynamics;
import 'profile.dart' as profile;

ReduxState reduxReducer(ReduxState state, action) => ReduxState(
    home: home.reducer(state.home, action),
    rank: rank.reducer(state.rank, action),
    lib: lib.reducer(state.lib, action),
    search: search.reducer(state.search, action),
    dynamics: dynamics.reducer(state.dynamics, action),
    profile: profile.reducer(state.profile, action));
