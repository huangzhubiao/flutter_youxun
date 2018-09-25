import '../../models/article_comment.dart';
import 'main.dart';

class UpdateArticleComments extends ActionType {
  final List<ArticleComment> payload;
  UpdateArticleComments({this.payload}) : super(payload: payload);
}
