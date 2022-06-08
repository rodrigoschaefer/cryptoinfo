import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class Utils {
  static void showSnackBar({required BuildContext context, required String msg}) {
    final snackBar = SnackBar(
      content: Text(
        msg,
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
    // Find the Scaffold in the widget tree and use
    // it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Offset getWidgetPosition(GlobalKey key) {
    var box = key.currentContext!.findRenderObject() as RenderBox;
    return box.localToGlobal(Offset.zero);
  }

  static Size getWidgetSize(GlobalKey key) {
    var box = key.currentContext!.findRenderObject() as RenderBox;
    return box.size;
  }

  static void showAlertContentNoButton(
      {required BuildContext context, Widget? content, bool dismissible = true, double borderRadius = 15}) {
    showDialog(
      barrierDismissible: dismissible,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () => Future.value(dismissible),
          child: AlertDialog(
            content: content,
            scrollable: true,
            actionsOverflowDirection: VerticalDirection.down,
            backgroundColor: const Color.fromARGB(255,25, 26, 27),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
          ),
        );
      },
    );
  }

  static void showAlertContent(
      {required BuildContext context,
      Widget? title,
      List<Widget>? actions,
      bool dismissible = true}) {

    showDialog(
      barrierDismissible: dismissible,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () => Future.value(dismissible),
          child: AlertDialog(
            scrollable: true,
            actionsOverflowDirection: VerticalDirection.down,
            backgroundColor: Theme.of(context).cardColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            title: title,
            actions: actions,
          ),
        );
      },
    );
  }


  static void onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
  }

  static Future<dynamic> navigateToPage(context, Widget page, {bool fullscreen = false, String? routeName}) {
    return Navigator.push(
      context,
      routeName == null
          ? MaterialPageRoute(
              fullscreenDialog: fullscreen,
              builder: (BuildContext context) {
                return page;
              })
          : MaterialPageRoute(
              builder: (_) {
                return page;
              },
              settings: RouteSettings(
                name: routeName,
              ),
            ),
    );
  }

  static OverlayEntry showOverlay(BuildContext context, Widget body) {
    var overlayState = Overlay.of(context)!;
    var overlayEntry = OverlayEntry(builder: (context) => body);
    overlayState.insert(overlayEntry);
    return overlayEntry;
  }

  static int secondsSince(DateTime beginning) {
    return DateTime.now().difference(beginning).inSeconds;
  }





  static Duration? timeUntil(DateTime endTime) {
    final now = DateTime.now();
    if (now.millisecondsSinceEpoch > endTime.millisecondsSinceEpoch) {
      return null;
    }
    return now.difference(endTime).abs();
  }

  static void navigateToPagePop(context, Widget page, FutureOr<void> Function(dynamic) onBack,
      {bool fullscreen = false, String? routeName}) {
    Navigator.push(
      context,
      routeName == null
          ? MaterialPageRoute(builder: (BuildContext context) {
              return page;
            })
          : MaterialPageRoute(
              builder: (BuildContext context) {
                return page;
              },
              settings: RouteSettings(
                name: routeName,
              ),
            ),
    ).then(onBack);
  }

  static void launchUrl(String _url) async => await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

  static Route slideTransition({required Widget page}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static void navigateToPageWithNamedRoute(context, Widget page, {bool fullscreen = false,required String routeName}) {
    Navigator.push(context,MaterialPageRoute(settings: RouteSettings(name: routeName), builder: (BuildContext context) {
      return page;
    }));
  }

  static void popUntilNamedRoute(context, {required String routeName}) {
    Navigator.popUntil(context, (route) => route.settings.name == routeName);
  }

}
