import 'package:Taallam/config/Config.dart';

import '../helper/api.dart';
import '../models/FeaturedCoursesmodel.dart';
import '../models/recent_model.dart';
import '../screens/Course/recentCourses.dart';

class RecentService {
  Future<List<RecentModel>> getAllRecent() async {
    List<dynamic> data = await Api().get(url: '${ApiVariables.recent}');

    List<RecentModel> recentList = [];
    for (int i = 0; i < data.length; i++) {
      recentList.add(RecentModel.fromJson(data[i]));
    }
    return recentList;
  }
}
