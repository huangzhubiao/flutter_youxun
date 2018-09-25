import '../../models/profile.dart';
import 'main.dart';

class UpdateUserProfile extends ActionType {
  final Profile payload;
  UpdateUserProfile({this.payload}) : super(payload: payload);
}
