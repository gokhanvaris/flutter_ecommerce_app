import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants/extensions/app_padding_extension.dart';
import 'package:flutter_ecommerce_app/theme/theme.dart';
import 'package:flutter_ecommerce_app/widgets/empty_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

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
                    'dont_have_account_text'.tr(),
                    style: AppDefaultTheme()
                        .themeData
                        .textTheme
                        .bodyText1,
                  ),
                  EmptyWidget().lowEmptyWidget,
                  Text(
                    'sign_in'.tr(),
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
                ],
              ),
              EmptyWidget()
                  .largeEmptyWidgetHeight,
              TextField(
                decoration: InputDecoration(
                  focusColor: AppDefaultTheme()
                      .themeData
                      .scaffoldBackgroundColor,
                  fillColor: AppDefaultTheme()
                      .themeData
                      .scaffoldBackgroundColor,
                  hoverColor: AppDefaultTheme()
                      .themeData
                      .scaffoldBackgroundColor,
                  prefixIcon:
                      const Icon(Icons.mail),
                  label: const Text('E-Mail'),
                  labelStyle: TextStyle(
                      color: AppDefaultTheme()
                          .themeData
                          .scaffoldBackgroundColor),
                  prefixStyle: TextStyle(
                      color: AppDefaultTheme()
                          .themeData
                          .scaffoldBackgroundColor),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppDefaultTheme()
                              .themeData
                              .scaffoldBackgroundColor)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppDefaultTheme()
                              .themeData
                              .scaffoldBackgroundColor)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
