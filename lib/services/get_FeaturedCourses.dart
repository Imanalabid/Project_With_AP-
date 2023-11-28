import '../helper/api.dart';
import '../models/FeaturedCoursesmodel.dart';

class FeaturedService {
  Future<List<FCModel>> getAllFCategry() async {
    List<dynamic> data =
        await Api().get(url: 'https://osus.academy/home/featured_courses_api/');

    List<FCModel> popularList = [];
    for (int i = 0; i < data.length; i++) {
      popularList.add(FCModel.fromJson(data[i]));
    }
    return popularList;
  }
}
