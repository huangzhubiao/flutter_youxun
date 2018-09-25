import 'package:redux/redux.dart';
import '../../models/profile.dart';
import '../states/main.dart';
import 'main.dart';

class ProfileViewModel extends ViewModel {
  ProfileViewModel(Store<ReduxState> store) : super(store);

  Profile get profile => this.store.state.profile.profile;
}
