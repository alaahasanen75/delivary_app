import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/componant/acount_widget.dart';
import 'package:flutter_application_1/core/componant/app_icon.dart';
import 'package:flutter_application_1/core/componant/big_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManage.Primary,
        title: Center(
          child: BigText(
            text: 'Profile',
            size: 14.sp,
            color: ColorManage.white,
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 20.h),
        child: Column(children: [
          Container(
            width: 140.r,
            height: 140.r,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(140.r / 2),
                color: ColorManage.Primary),
            child: Icon(
              color: ColorManage.white,
              Icons.person,
              size: 80.r,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  MyWidget(
                      appIcon: Container(
                        width: 30.r,
                        height: 30.r,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r / 2),
                            color: ColorManage.Primary),
                        child: Icon(
                          color: ColorManage.white,
                          Icons.person,
                          size: 18.r,
                        ),
                      ),
                      bigText: BigText(text: 'Alaa')),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyWidget(
                      appIcon: Container(
                        width: 30.r,
                        height: 30.r,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r / 2),
                            color: ColorManage.yellowColor),
                        child: Icon(
                          color: ColorManage.white,
                          Icons.phone,
                          size: 18.r,
                        ),
                      ),
                      bigText: BigText(text: '0109865')),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyWidget(
                      appIcon: Container(
                        width: 30.r,
                        height: 30.r,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r / 2),
                            color: ColorManage.yellowColor),
                        child: Icon(
                          color: ColorManage.white,
                          Icons.email_outlined,
                          size: 18.r,
                        ),
                      ),
                      bigText: BigText(text: 'Alaa@gmail.com')),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyWidget(
                      appIcon: Container(
                        width: 30.r,
                        height: 30.r,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r / 2),
                            color: ColorManage.yellowColor),
                        child: Icon(
                          color: ColorManage.white,
                          Icons.location_on,
                          size: 18.r,
                        ),
                      ),
                      bigText: BigText(text: 'Adress')),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyWidget(
                      appIcon: Container(
                        width: 30.r,
                        height: 30.r,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r / 2),
                            color: Colors.redAccent),
                        child: Icon(
                          color: ColorManage.white,
                          Icons.message_outlined,
                          size: 18.r,
                        ),
                      ),
                      bigText: BigText(text: 'Alaa')),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
