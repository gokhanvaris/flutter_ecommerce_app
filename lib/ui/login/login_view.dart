import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/auth/login/login_bloc.dart';
import 'package:flutter_ecommerce_app/constants/assets/image_constant.dart';
import 'package:flutter_ecommerce_app/constants/enums/router_enums.dart';
import 'package:flutter_ecommerce_app/constants/extensions/app_padding_extension.dart';
import 'package:flutter_ecommerce_app/controller/dialog_controller.dart';
import 'package:flutter_ecommerce_app/theme/theme.dart';
import 'package:flutter_ecommerce_app/widgets/empty_widget.dart';
import 'package:flutter_ecommerce_app/widgets/textfield.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  DialogController dialogController =
      Get.put(DialogController());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginWaitingState) {
            } else {
              if (state is LoginSuccessState) {
                GoRouter.of(context).go(
                    RouterEnums.HOMEPAGE.value);
              }
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment:
                  MainAxisAlignment.end,
              children: const [
                _buildLoginHeader(),
                _buildHeaderText(),
                _buildFormContainer(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _buildHeaderText extends StatelessWidget {
  const _buildHeaderText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const AppPadding.custom(bottom: 20),
      child: Text(
        'login_title'.translate(),
        style: AppDefaultTheme()
            .themeData
            .textTheme
            .headline6
            ?.copyWith(
                color: AppDefaultTheme()
                    .themeData
                    .canvasColor,
                fontSize: 24,
                fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _buildLoginHeader extends StatelessWidget {
  const _buildLoginHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const AppPadding.custom(
          bottom: 20, top: 50),
      child: SizedBox(
        height: 250,
        width: MediaQuery.of(context).size.width,
        child:
            Image.asset(ImageConstant.loginLogo),
      ),
    );
  }
}

class _buildFormContainer
    extends StatelessWidget {
  const _buildFormContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0)),
          color: AppDefaultTheme()
              .themeData
              .canvasColor,
        ),
        height:
            MediaQuery.of(context).size.height /
                2,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const AppPadding.xLargeAll(),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                'welcome_text'.translate(),
                style: AppDefaultTheme()
                    .themeData
                    .textTheme
                    .headline6,
              ),
              Row(
                children: [
                  Text(
                    'dont_have_account_text'
                        .translate(),
                    style: AppDefaultTheme()
                        .themeData
                        .textTheme
                        .bodyText1,
                  ),
                  EmptyWidget().lowEmptyWidget,
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go(
                          RouterEnums
                              .REGISTER.value);
                    },
                    child: Text(
                      'sign_in'.translate(),
                      style: AppDefaultTheme()
                          .themeData
                          .textTheme
                          .bodyText1
                          ?.copyWith(
                            color: AppDefaultTheme()
                                .themeData
                                .scaffoldBackgroundColor,
                            decoration:
                                TextDecoration
                                    .underline,
                          ),
                    ),
                  ),
                ],
              ),
              EmptyWidget()
                  .largeEmptyWidgetHeight,
              AppTextField(
                label: 'e_mail'.translate(),
                icon: Icons.mail,
              ),
              EmptyWidget()
                  .largeEmptyWidgetHeight,
              AppTextField(
                  isSecure: true,
                  icon: Icons.visibility_off,
                  label: 'password'.translate()),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,
                children: [
                  Expanded(
                    child: Transform.scale(
                      scale: 1.070,
                      child: CheckboxListTile(
                        contentPadding:
                            const AppPadding
                                .custom(),
                        isThreeLine: false,
                        activeColor: AppDefaultTheme()
                            .themeData
                            .scaffoldBackgroundColor,
                        tileColor: AppDefaultTheme()
                            .themeData
                            .scaffoldBackgroundColor,
                        title: Text(
                            "remember_me"
                                .translate(),
                            style:
                                AppDefaultTheme()
                                    .themeData
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        fontSize:
                                            14.0)),
                        value: true,
                        onChanged: (newValue) {},
                        controlAffinity:
                            ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                      ),
                    ),
                  ),
                  EmptyWidget().midEmptyWidget,
                  Text(
                    'forgot_password'.translate(),
                    style: AppDefaultTheme()
                        .themeData
                        .textTheme
                        .bodyText2
                        ?.copyWith(
                          decoration:
                              TextDecoration
                                  .underline,
                        ),
                  ),
                ],
              ),
              EmptyWidget()
                  .mediumEmptyWidgetHeight,
              Container(
                decoration: BoxDecoration(
                    color: AppDefaultTheme()
                        .themeData
                        .scaffoldBackgroundColor),
                height: 50,
                width: MediaQuery.of(context)
                    .size
                    .width,
                child: TextButton(
                    onPressed: () {
                      // GoRouter.of(context).go(
                      //     RouterEnums
                      //         .HOMEPAGE.value);

                      context
                          .read<LoginBloc>()
                          .add(
                              const LoginEvent());
                    },
                    child: Center(
                      child: Text(
                        'login_text'.translate(),
                        style: AppDefaultTheme()
                            .themeData
                            .textTheme
                            .bodyText2
                            ?.copyWith(
                                fontSize: 18.0,
                                color:
                                    Colors.white),
                      ),
                    )),
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    margin:
                        const AppPadding.custom(
                            left: 10.0,
                            right: 20.0),
                    height: 50,
                    child: Divider(
                        color: AppDefaultTheme()
                            .themeData
                            .scaffoldBackgroundColor),
                  )),
                  Text('or'.translate()),
                  Expanded(
                      child: Container(
                    margin:
                        const AppPadding.custom(
                            left: 10.0,
                            right: 20.0),
                    height: 50,
                    child: Divider(
                        color: AppDefaultTheme()
                            .themeData
                            .scaffoldBackgroundColor),
                  )),
                ],
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context)
                    .size
                    .width,
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceEvenly,
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      ImageConstant.appleLogo,
                    ),
                    Image.asset(
                      ImageConstant.facebookLogo,
                    ),
                    Image.asset(
                      ImageConstant.twitterLogo,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
