import '../acitons/main.dart';
import '../acitons/search.dart';
import '../states/search.dart';

SearchState reducer(SearchState state, ActionType action) {
  if (action is UpdateHotKeywords) {
    return state.copyWith(keywords: action.payload);
  }
  if (action is UpdateSearchResults) {
    return state.copyWith(results: action.payload);
  }
  return state;
}
