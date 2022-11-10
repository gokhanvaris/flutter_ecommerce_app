import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants/extensions/app_padding_extension.dart';
import 'package:flutter_ecommerce_app/theme/theme.dart';
import 'package:flutter_ecommerce_app/widgets/empty_widget.dart';
import 'package:flutter_ecommerce_app/widgets/textfield.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          _buildLoginHeader(),
          _buildHeaderText(),
          _buildFormContainer(),
        ],
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
        'login_title'.tr(),
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
        child: Image.asset(
            'assets/images/logo_login.png'),
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
                'welcome_text'.tr(),
                style: AppDefaultTheme()
                    .themeData
                    .textTheme
                    .headline6,
              ),
              Row(
                children: [
                  Text(
                    'have_an_account'.tr(),
                    style: AppDefaultTheme()
                        .themeData
                        .textTheme
                        .bodyText1,
                  ),
                  EmptyWidget().lowEmptyWidget,
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .go('/');
                    },
                    child: Text(
                      'sign_up'.tr(),
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
                label: 'e_mail'.tr(),
                icon: Icons.mail,
              ),
              EmptyWidget()
                  .largeEmptyWidgetHeight,
              AppTextField(
                  isSecure: true,
                  icon: Icons.visibility_off,
                  label: 'password'.tr()),
              EmptyWidget()
                  .largeEmptyWidgetHeight,
              AppTextField(
                  isSecure: true,
                  icon: Icons.visibility_off,
                  label: 'password'.tr()),
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
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        'sign_in'.tr(),
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
            ],
          ),
        ),
      ),
    );
  }
}
