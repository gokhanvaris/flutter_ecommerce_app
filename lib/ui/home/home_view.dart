import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants/extensions/app_padding_extension.dart';
import 'package:flutter_ecommerce_app/theme/theme.dart';
import 'package:flutter_ecommerce_app/widgets/empty_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
    // return Scaffold(
    //   backgroundColor:
    //       AppDefaultTheme().themeData.canvasColor,
    //   body: SafeArea(
    //       child: Padding(
    //     padding: const AppPadding.mediumAll(),
    //     child: SizedBox(
    //         child: Row(
    //       mainAxisAlignment:
    //           MainAxisAlignment.spaceAround,
    //       children: [
    //         Flexible(
    //           child: TextField(
    //             decoration: InputDecoration(
    //               labelText: "e_mail".tr(),
    //               fillColor: const Color.fromRGBO(
    //                   241, 240, 243, 1),
    //               border: OutlineInputBorder(
    //                 borderRadius:
    //                     BorderRadius.circular(
    //                         10.0),
    //                 borderSide:
    //                     const BorderSide(),
    //               ),
    //             ),
    //           ), // <-- Wrapped in Flexible.
    //         ),
    //         EmptyWidget().lowEmptyWidget,
    //         const Flexible(
    //           child: CircleAvatar(
    //             backgroundColor: Color.fromRGBO(
    //                 241, 240, 243, 1),
    //             child: Icon(Icons.save),
    //           ), // <-- Wrapped in Flexible.
    //         ),
    //         EmptyWidget().lowEmptyWidget,
    //         const CircleAvatar(
    //           backgroundColor: Color.fromRGBO(
    //               241, 240, 243, 1),
    //           child: Flexible(
    //             child: Icon(Icons
    //                 .save), // <-- Wrapped in Flexible.
    //           ),
    //         ),
    //       ],
    //     )),
    //   )),
    // );
  }
}
