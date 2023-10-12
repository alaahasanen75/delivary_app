import 'package:dartz/dartz.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/componant/big_text.dart';
import 'package:flutter_application_1/core/componant/constant.dart';
import 'package:flutter_application_1/core/componant/text_formfield.dart';
import 'package:flutter_application_1/core/fonts_manager.dart';
import 'package:flutter_application_1/core/shard.dart';
import 'package:flutter_application_1/model_view/login_cubit.dart';
import 'package:flutter_application_1/model_view/state_logincubit.dart';
import 'package:flutter_application_1/presentation/Layout_screen.dart';
import 'package:flutter_application_1/presentation/sign_in_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegesterView extends StatelessWidget {
  RegesterView({super.key});
  TextEditingController phonecontrolar = TextEditingController();
  TextEditingController passwordcontrolar = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginCubitState>(
            builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: Container(
                        height: 150.h,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(
                            'https://images.squarespace-cdn.com/content/v1/57c58c3ae3df28187860a4cb/1a5d927d-4532-48c4-9cc6-97a9cc14a6fc/Artboard+14.png',
                          ),
                        )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Hello',
                              style: TextStyle(
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManage.black),
                            ),
                            RichText(
                                text: TextSpan(
                              text: 'Sign into your account',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: FontSize.s12.sp),
                            ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextFormfield(
                        name: TextInputType.emailAddress,
                        controller: phonecontrolar,
                        icon: Icons.email,
                        text: 'Email'),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormfield(
                        name: TextInputType.visiblePassword,
                        controller: passwordcontrolar,
                        icon: Icons.password,
                        text: 'Password'),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: RichText(
                            text: TextSpan(
                          text: 'Sign into your account',
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: FontSize.s12.sp),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    InkWell(
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          LoginCubit.get(context).UseLogin(
                              email: phonecontrolar.text,
                              password: passwordcontrolar.text);
                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: 135.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: ColorManage.Primary),
                        child: Center(
                            child: BigText(
                                text: 'Sign in',
                                color: ColorManage.white,
                                size: 15.sp)),
                      ),
                    ),
                    SizedBox(
                      height: 45.h,
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'Don\'t have an account',
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: FontSize.s12.sp),
                            children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(context).push(
                                      MaterialPageRoute(builder: ((context) {
                                    return SignInView();
                                  }))),
                            text: 'Create',
                            style: TextStyle(
                                color: ColorManage.mainBlackColor,
                                fontSize: FontSize.s14.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ])),
                  ],
                ),
              ),
            ),
          );
        }, listener: (BuildContext context, state) {
          if (state is SuccessfulyLoginShopAppState) {
            if (state.model!.status!) {
              print(state.model!.masage!);
              print(state.model!.Data!.token!);
              CachHelper.SaveData(
                      value: state.model!.Data!.token!, key: 'token')
                  .then((value) {
                token = state.model!.Data!.token!;
                print(token);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: ((context) => MainScreen())),
                    (route) => false);
              });
            } else {
              print('${state.model!.masage!}hhhhhhhhhhhhhhhhhhhhh');
              ShowToast(msg: state.model!.masage!, states: ToastStates.ERROR);
            }
          }

          if (state is ErrorLoginShopAppState) {
            print('${state.error}hhhhhhhhhhhhhhhhhhhhh');
          }
        }));
  }
}
