import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s17_news_portal/routing/app_routing.dart';
import 'package:s17_news_portal/themes/app_theme.dart';
import 'services/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsServices()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: appTheme,
        initialRoute: AppRouting.initialRoute,
        routes: AppRouting.routes
      ),
    );
  }

}