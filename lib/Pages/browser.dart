  import 'package:flutter/material.dart';
  import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';


   

  Future<void> launchURL(BuildContext context, url) async {
    try {
      await launch(
        // NOTE: Replace this URL with your GitHub Pages URL.
        url,
        option: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: false,
          animation: CustomTabsAnimation.slideIn(),
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }
