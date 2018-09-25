import '../acitons/main.dart';
import '../acitons/profile.dart';
import '../states/profile.dart';

ProfileState reducer(ProfileState state, ActionType action) {
  if (action is UpdateUserProfile) {
    return state.copyWith(profile: action.payload);
  }
  return state;
}
