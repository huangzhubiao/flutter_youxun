import 'package:redux/redux.dart';
import '../../util/NetUtils.dart';
import '../../models/lib_resource.dart';
import '../states/main.dart';
import 'main.dart';

class LibViewModel extends ViewModel {
  LibViewModel(Store<ReduxState> store) : super(store);

  List<LibResource> get resources => this.store.state.lib.resources;
  List<LibResource> get filtedResources => this.store.state.lib.filtedResources;
  List<String> get years => ["ALL"]..addAll(this.store.state.lib.category.year);
  List<String> get categories =>
      ["ALL"]..addAll(store.state.lib.category.category);
  List<String> get tvs => ["ALL"]..addAll(this.store.state.lib.category.tv);
  bool get isLoading => this.store.state.lib.isLoading;

  String selectedCategory = "";
  String selectedYear = "";
  String selectedTv = "";
  String sort = "itemupdate";
  String area = "";

  void refresResources() {
    final category = selectedCategory == "ALL" ? "" : selectedCategory;
    final year = selectedYear == "ALL" ? "" : selectedYear;
    final tv = selectedTv == "ALL" ? "" : selectedTv;
    Networking.fetchLibResources(
        category: category, year: year, tv: tv, sort: sort, area: area);
  }
}
