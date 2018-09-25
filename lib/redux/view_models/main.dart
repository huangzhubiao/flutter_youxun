import 'package:redux/redux.dart';
import '../states/dynamic.dart';
import '../states/home.dart';
import '../states/lib.dart';
import '../states/main.dart';
import '../reducers/main.dart';
import '../states/profile.dart';
import '../states/rank.dart';
import '../states/search.dart';

abstract class ViewModel {
  final Store<ReduxState> store;
  ViewModel(this.store);
}

class StoreContainer {
  static final Store<ReduxState> global = reduxStore();
}

Store reduxStore() => Store<ReduxState>(reduxReducer,
    initialState: ReduxState(
        home: HomeState.initialState(),
        rank: RankState.initialState(),
        lib: LibState.initialState(),
        search: SearchState.initialState(),
        dynamics: DynamicState.initialState(),
        profile: ProfileState.initialState()));
