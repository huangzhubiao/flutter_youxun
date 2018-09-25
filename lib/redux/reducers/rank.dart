import '../acitons/main.dart';
import '../acitons/rank.dart';
import '../states/rank.dart';

RankState reducer(RankState state, ActionType action) {
  if (action is UpdateTopRanks) {
    return state.copyWith(ranks: action.payload, isLoading: false);
  }
  return state;
}
