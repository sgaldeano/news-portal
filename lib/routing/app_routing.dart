import 'package:flutter/cupertino.dart';
import 'package:s17_news_portal/pages/pages.dart';

class AppRouting {

  static const String initialRoute = TabsPage.routeName;

  static final Map<String, Widget Function(BuildContext context)> routes = {
    TabsPage.routeName: (_) => const TabsPage()
  };

}