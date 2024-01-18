import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:Taallam/config/Config.dart';

import '../home/home_page.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Get.toNamed('/profile');
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: AppColors.Icon1Color,
                  )),
            ],
          ),
          Container(
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 75,
                backgroundImage: AssetImage('assets/img/profile.png'),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(right: 30, bottom: 10, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Name',
                    style: TextStyle(
                        fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                        fontSize: 15.0,
                        color: AppColors.secoundfontColor,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 7, left: 12),
                  child: Icon(
                    Icons.person_outline,
                    size: 20,
                    color: AppColors.Icon1Color,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Text(' Name',
                      style: TextStyle(
                          fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                          fontSize: 15.0,
                          color: AppColors.smalltextfontColor,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.only(right: 30, bottom: 10, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Email',
                    style: TextStyle(
                        fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                        fontSize: 15.0,
                        color: AppColors.mainfontColor,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 7, left: 12),
                  child: Icon(
                    Icons.mail,
                    size: 20,
                    color: AppColors.Icon1Color,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Text('test@gmail.com',
                      style: TextStyle(
                          fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                          fontSize: 15.0,
                          color: AppColors.smalltextfontColor,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.only(right: 30, bottom: 10, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Phone number',
                    style: TextStyle(
                        fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                        fontSize: 15.0,
                        color: AppColors.mainfontColor,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 7, left: 12),
                  child: Icon(
                    Icons.phone,
                    size: 20,
                    color: AppColors.Icon1Color,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Text('90555555555+',
                      style: TextStyle(
                          fontFamily: isArabic() ? 'Cairo' : 'aloevera',
                          fontSize: 15.0,
                          color: AppColors.smalltextfontColor,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
