import '../../models/resource.dart';
import 'main.dart';

class UpdateTopRanks extends ActionType {
  final Ranks payload;
  UpdateTopRanks({this.payload}) : super(payload: payload);
}
