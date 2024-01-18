import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../config/Config.dart';
import '../../../../generated/l10n.dart';
import '../../../../main.dart';
import '../../../../models/lessonModel.dart';
import '../../../../services/get_all_courses.dart';
import '../../../home/home_page.dart';
import '../../../profile/search.dart';

class DropdownPage extends StatefulWidget {
  final String courseID;
  final String video;
  bool isExpanded;

  DropdownPage({
    Key? key,
    this.isExpanded = true,
    required this.courseID,
    required this.video,
  }) : super(key: key);

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage>
    with TickerProviderStateMixin {
  List<Course> courses = [];
  int selectedLessonIndex = -1; // Added to keep track of selected lesson index

  late VideoPlayerController _videoPlayerController;
  late ChewieController? _chewieController;
  int selectedButtonIndex = 0;
  String selectedLessonName = '';
  late TabController _tabController;

  @override
  @override
  void initState() {
    super.initState();
    fetchCourses();
    _tabController = TabController(length: 3, vsync: this); // 3 tabs

    _initializeControllers();
  }

  void _initializeControllers() {
    _videoPlayerController = VideoPlayerController.network(widget.video);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
    );
  }

  void fetchCourses() async {
    List<Course> items = await getAllCoursesPageOfCategory(widget.courseID);
    setState(() {
      courses = items;
    });
  }

  void _updateVideoPlayerController(String videoUrl) {
    print(videoUrl);
    String temp = '${ApiVariables.VideoConfig}/$videoUrl';
    _videoPlayerController.pause();
    _videoPlayerController.dispose();
    _videoPlayerController = VideoPlayerController.network(temp);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
    );
    setState(() {
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 25.w, top: 40.h, left: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                color: theme.cardColor.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Center(
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                              ),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child:
                            Container(height: 70.h, child: LogoImage.logoImage),
                      )
                    ],
                  )),
              Container(
                height: 200.h,
                width: double.infinity,
                child: _chewieController != null
                    ? Chewie(controller: _chewieController!)
                    : CircularProgressIndicator(),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.w, left: 10.w),
                      child: TabBar(
                        controller: _tabController,
                        indicatorColor: theme.cardColor,
                        labelColor: AppColors.secoundfontColor,
                        unselectedLabelColor: Colors.grey.shade400,
                        tabs: [
                          Tab(
                            child: Text(
                              ' الدروس',
                              style: theme.textTheme.bodyText1?.copyWith(
                                fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                              child: Text(
                            'الآراء',
                            style: theme.textTheme.bodyText1?.copyWith(
                              fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          Tab(
                              child: Text(
                            'المعلمون',
                            style: TextStyle(
                              fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ],
                        onTap: (index) {
                          setState(() {
                            selectedButtonIndex = index;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ],
                ),
              ),
              selectedButtonIndex == 0
                  ? Container(
                      width: 330.w,
                      margin: EdgeInsets.all(5),
                      child: ExpansionPanelList(
                        elevation: 1,
                        dividerColor: theme.cardColor.withOpacity(0.2),
                        expandedHeaderPadding: EdgeInsets.all(0),
                        expansionCallback: (int index, bool isExpanded) {
                          setState(() {
                            selectedLessonIndex =
                                (selectedLessonIndex == index) ? -1 : index;
                          });
                        },
                        children: courses.asMap().entries.map((entry) {
                          final int courseIndex = entry.key;
                          final Course course = entry.value;

                          return ExpansionPanel(
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return ListTile(
                                title: Text(
                                  course.name,
                                  style: theme.textTheme.bodyText1?.copyWith(
                                    fontFamily:
                                        isArabic() ? 'Cairo' : 'aloevera',
                                    fontSize: 15.sp,
                                  ),
                                ),
                              );
                            },
                            body: Column(
                              children: course.lessons
                                  .asMap()
                                  .entries
                                  .map((lessonEntry) {
                                final int lessonIndex = lessonEntry.key;
                                final Lesson lesson = lessonEntry.value;

                                return ListTile(
                                  title: Text(
                                    lesson.name,
                                    style: theme.textTheme.bodyText1?.copyWith(
                                      fontFamily:
                                          isArabic() ? 'Cairo' : 'aloevera',
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedLessonIndex = lessonIndex;
                                      selectedLessonName = lesson.name;
                                    });
                                    _updateVideoPlayerController(lesson.video);
                                  },
                                );
                              }).toList(),
                            ),
                            isExpanded: selectedLessonIndex == courseIndex,
                          );
                        }).toList(),
                      ),
                    )
                  : Container(
                      color: selectedButtonIndex == 1
                          ? Colors.transparent
                          : selectedButtonIndex == 2
                              ? Colors.transparent
                              : Colors.transparent,
                      height: 100,
                      width: 100,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(int index, String buttonText) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedButtonIndex = index;
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          selectedButtonIndex == index
              ? AppColors.secoundfontColor
              : Colors.grey.shade400,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontFamily: isArabic() ? 'Cairo' : 'aloevera',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.pause();
    _videoPlayerController.dispose();
    super.dispose();
  }
}
