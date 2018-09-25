import 'package:flutter/foundation.dart';
import '../../models/keyword.dart';
import '../../models/lib_resource.dart';

@immutable
class SearchState {
  final List<Keyword> keywords;
  final List<LibResource> results;

  SearchState({this.keywords, this.results});

  SearchState copyWith({List<Keyword> keywords, List<LibResource> results}) {
    return SearchState(
        keywords: keywords ?? this.keywords, results: results ?? this.results);
  }

  SearchState.initialState()
      : keywords = [],
        results = [];
}
