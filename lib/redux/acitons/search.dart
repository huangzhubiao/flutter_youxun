import '../../models/keyword.dart';
import '../../models/lib_resource.dart';
import 'main.dart';

class UpdateHotKeywords extends ActionType {
  final List<Keyword> payload;
  UpdateHotKeywords({this.payload}) : super(payload: payload);
}

class UpdateSearchResults extends ActionType {
  final List<LibResource> payload;
  UpdateSearchResults({this.payload}) : super(payload: payload);
}
