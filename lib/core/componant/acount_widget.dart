import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/componant/app_icon.dart';
import 'package:flutter_application_1/core/componant/big_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyWidget extends StatelessWidget {
  Container appIcon;
  BigText bigText;
  MyWidget({super.key, required this.appIcon, required this.bigText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorManage.white, boxShadow: [
        BoxShadow(
            blurRadius: 1,
            offset: Offset(0, 2),
            color: ColorManage.grey.withOpacity(0.2))
      ]),
      padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
      child: Row(children: [
        appIcon,
        SizedBox(
          width: 10.w,
        ),
        bigText
      ]),
    );
  }
}
