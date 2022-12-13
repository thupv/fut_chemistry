import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

mixin CommonDialogMixin<T extends StatefulWidget> on State<T> {
  Future<T> showFloatingModalBottomSheet<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    Color? backgroundColor,
  }) async {
    return await showCustomModalBottomSheet(
      context: context,
      builder: builder,
      containerWidget: (_, animation, child) => child,
      expand: false,
    );
  }

  Future<bool?> showToast({
    required String message,
    Color backgroundColor = Colors.red,
  }) async {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: Colors.black38,
      fontSize: 16.0,
    );
  }

  // Future<bool?> showConfirmDelete(
  //   BuildContext context, {
  //   String? backgroundImage,
  //   String? cardImage,
  //   GestureTapCallback? onTapDelete,
  // }) async {
  //   return showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       contentPadding: EdgeInsets.zero,
  //       titlePadding: EdgeInsets.zero,
  //       actionsPadding: EdgeInsets.zero,
  //       buttonPadding: EdgeInsets.zero,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //       title: Container(
  //         height: 100,
  //         width: 100,
  //         alignment: Alignment.center,
  //         child: Lottie.asset(
  //           'assets/json/delete.json',
  //         ),
  //       ),
  //       content: Container(
  //         width: 500,
  //         height: 50,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Text(
  //               'Images will not be recoverable.\nAre you really want to delete ?',
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                 fontSize: 16,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       actions: [
  //         Row(
  //           children: [
  //             Expanded(
  //               child: InkWell(
  //                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
  //                 onTap: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: Container(
  //                   color: Colors.grey.withOpacity(0.25),
  //                   height: MediaQuery.of(context).size.height * 0.08,
  //                   alignment: Alignment.center,
  //                   child: const Text(
  //                     'CANCEL',
  //                     style: TextStyle(
  //                       fontSize: 12,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               child: InkWell(
  //                 borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
  //                 splashColor: Colors.grey,
  //                 onTap: onTapDelete,
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                     color: Colors.red,
  //                     borderRadius: BorderRadius.only(
  //                       bottomRight: Radius.circular(15),
  //                     ),
  //                   ),
  //                   height: MediaQuery.of(context).size.height * 0.08,
  //                   alignment: Alignment.center,
  //                   child: const Text(
  //                     'DELETE',
  //                     style: TextStyle(
  //                       fontSize: 12,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Future<bool?> showSuccessful(
  //   BuildContext context, {
  //   String? backgroundImage,
  //   String? cardImage,
  // }) async {
  //   return showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       contentPadding: EdgeInsets.zero,
  //       titlePadding: EdgeInsets.zero,
  //       actionsPadding: EdgeInsets.zero,
  //       buttonPadding: EdgeInsets.zero,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //       title: Stack(
  //         children: [
  //           Lottie.asset('assets/json/sparkle.json'),
  //           Positioned(
  //             top: 50,
  //             left: 80,
  //             right: 80,
  //             child: CircleAvatar(
  //               radius: 40.0,
  //               child: Image.asset('assets/img/congratulation.png'),
  //             ),
  //           ),
  //           Positioned(
  //             top: 140,
  //             child: Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 10),
  //               child: Text(
  //                 'Congratulations on your card saved successful !',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                   fontSize: 20,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //       actions: [
  //         GestureDetector(
  //           onTap: () {
  //             Navigator.pop(context);
  //           },
  //           child: Container(
  //             color: Colors.grey.withOpacity(0.25),
  //             height: MediaQuery.of(context).size.height * 0.08,
  //             width: MediaQuery.of(context).size.width,
  //             alignment: Alignment.center,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Future<bool?> showCustomAlertDialog(
      BuildContext context, {
        String? backgroundImage,
        String? cardImage,
      }) async {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        buttonPadding: EdgeInsets.zero,
        title: Container(
          color: Colors.grey.withOpacity(0.5),
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.9,
          alignment: Alignment.center,
          child: Row(
            children: [
              const Expanded(
                flex: 9,
                child: Align(
                  alignment: Alignment(0.3, 0),
                  child: Text('GROUP AWARD'),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.close),
                  ),
                ),
              ),
            ],
          ),
        ),
        content: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/img/branding/bgDetailHighlight.png",
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "assets/img/filters/rarity.png",
                    width: MediaQuery.of(context).size.width * 0.2,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            color: Colors.grey.withOpacity(0.25),
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: const Text(
              'x1 FUT Draft Premium Pitch Trophy (Untradeable)',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
