import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/extensions/app_padding_extension.dart';
import '../../theme/theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppDefaultTheme.whiteBackground,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const AppPadding.mediumAll(),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                              20),
                      borderSide: const BorderSide(
                          color: AppDefaultTheme
                              .greyBackGround)),
                  hintText: '...',
                  labelText:
                      'search_text'.translate(),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppDefaultTheme()
                        .themeData
                        .scaffoldBackgroundColor,
                  ),
                  suffixStyle: const TextStyle(
                      color: AppDefaultTheme
                          .greyBackGround)),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'E-commerce App',
        style: AppDefaultTheme()
            .themeData
            .textTheme
            .headline6,
      ),
      elevation: 0,
      backgroundColor:
          AppDefaultTheme.whiteBackground,
    );
  }
}
