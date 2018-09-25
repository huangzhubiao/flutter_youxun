import 'package:redux/redux.dart';
import '../../util/NetUtils.dart';
import '../../models/lib_resource.dart';
import '../states/main.dart';
import 'main.dart';

class SearchViewModel extends ViewModel {
  SearchViewModel(Store<ReduxState> store) : super(store);

  List<String> get keywords =>
      this.store.state.search.keywords.map((v) => v.keyword).toList();

  List<LibResource> get results => this.store.state.search.results;

  searchResrouces({String keyword}) {
    Networking.searchResrouces(keyword: keyword);
  }
}
