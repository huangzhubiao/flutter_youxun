import 'package:redux/redux.dart';
import '../../models/resource.dart';
import '../states/main.dart';
import 'main.dart';

class RankViewModel extends ViewModel {
  RankViewModel(Store<ReduxState> store) : super(store);

  Ranks get ranks => this.store.state.rank.ranks;
  bool get isLoading => this.store.state.rank.isLoading;
}
