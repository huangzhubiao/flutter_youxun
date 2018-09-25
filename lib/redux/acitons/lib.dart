import '../../models/lib_resource.dart';
import '../../models/resource_category.dart';
import 'main.dart';

class UpdateLibResources extends ActionType {
  final List<LibResource> payload;
  UpdateLibResources({this.payload}) : super(payload: payload);
}

class UpdateFiltedResources extends ActionType {
  final List<LibResource> payload;
  UpdateFiltedResources({this.payload}) : super(payload: payload);
}

class UpdateResourceCategory extends ActionType {
  final ResourceCategory payload;
  UpdateResourceCategory({this.payload}) : super(payload: payload);
}
