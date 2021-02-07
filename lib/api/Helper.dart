import 'package:myapp/api/ApiService.dart';

class Helper {
  static isSelectedCategory(article) {
    if (ApiService.selectedCategory != null)
      return ApiService.selectedCategory.sid == article.sid;
    else
      return false;
  }

  static isSelectedSubCategory1(article) {
    if (ApiService.selectedSubCategory1 != null)
      return ApiService.selectedSubCategory1.sid == article.sid;
    else
      return false;
  }

  static isSelectedSubCategory2(article) {
    if (ApiService.selectedSubCategory2 != null)
      return ApiService.selectedSubCategory2.sid == article.sid;
    else
      return false;
  }
}
