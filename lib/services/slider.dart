import 'package:Taallam/config/Config.dart';

import '../helper/api.dart';
import '../models/FeaturedCoursesmodel.dart';
import '../models/recent_model.dart';
import '../models/slider.dart';
import '../screens/Course/recentCourses.dart';

class SliderService {
  Future<List<SliderModel>> getAllSlider() async {
    List<dynamic> data = await Api().get(url: '${ApiVariables.slider}');
    print(data); // Add this line to print data to the console

    List<SliderModel> sliderList = [];
    for (int i = 0; i < data.length; i++) {
      sliderList.add(SliderModel.fromJson(data[i]));
    }
    return sliderList;
  }
}

Future<List<SliderModel>> getAllSlider() async {
  List<dynamic> data = await Api().get(url: '${ApiVariables.slider}');
  print(data); // Add this line to print data to the console

  List<SliderModel> sliderList = [];
  for (int i = 0; i < data.length; i++) {
    sliderList.add(SliderModel.fromJson(data[i]));
  }
  return sliderList;
}
