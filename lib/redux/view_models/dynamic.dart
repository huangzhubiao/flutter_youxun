import 'package:redux/redux.dart';
import '../../models/comment.dart';
import '../../models/help.dart';
import '../../redux/states/main.dart';
import 'main.dart';

class DynamicViewModel extends ViewModel {
  DynamicViewModel(Store<ReduxState> store) : super(store);

  List<Comment> get comments => this
      .store
      .state
      .dynamics
      .comments
      .where((v) => v.resourceInfo != null)
      .toList();

  List<Help> get helps => this.store.state.dynamics.helps;
  bool get isLoading => this.store.state.dynamics.isLoading;
}
