import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s17_news_portal/widgets/news_list.dart';
import '../services/services.dart';
import '../themes/app_theme.dart';

class Tab1Page extends StatefulWidget {

	const Tab1Page({super.key});

  @override
  State<Tab1Page> createState() => _Tab1PageState();

}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {

	@override
	Widget build(BuildContext context) {
	  super.build(context);

    final NewsServices newsServices = Provider.of<NewsServices>(context);

  	return Scaffold(
    	body: (newsServices.headlines.isNotEmpty)
				? NewsList(newsServices.headlines)
				: Center(
					child: CircularProgressIndicator(color: appTheme.colorScheme.secondary, strokeWidth: 4)
				)
		);
	}

  @override
  bool get wantKeepAlive => true;

}