import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:s17_news_portal/pages/pages.dart';

class TabsPage extends StatelessWidget {

  static const String routeName = 'tabs_page';

	const TabsPage({super.key});

	@override
	Widget build(BuildContext context) {
  	return ChangeNotifierProvider(
			create: (_) => _NavigationModel(),
  	  child: const AnnotatedRegion(
				value: SystemUiOverlayStyle.light,
  	    child: Scaffold(
    			body: _Pages(),
					bottomNavigationBar: _NavigationBar(),
				),
  	  ),
  	);
	}

}

class _Pages extends StatelessWidget {

  const _Pages();

  @override
  Widget build(BuildContext context) {

		final _NavigationModel navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
			controller: navigationModel.pageController,
			physics: const NeverScrollableScrollPhysics(),
			children: const [
				Tab1Page(),

				Tab2Page()
			],
		);
  }

}

class _NavigationBar extends StatelessWidget {

	const _NavigationBar();

	@override
	Widget build(BuildContext context) {

		final _NavigationModel navigationModel = Provider.of<_NavigationModel>(context);

		return BottomNavigationBar(
			currentIndex: navigationModel.currentPage,
			onTap: (index) => navigationModel.currentPage = index,
			items: const [
				BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined),
					label: 'For you'
				),

				BottomNavigationBarItem(
					icon: Icon(Icons.public_outlined),
					label: 'Headlines'
				)
			],
		);
	}

}

class _NavigationModel with ChangeNotifier {

	int _currentPage = 0;
	final PageController _pageController = PageController();

	int get currentPage => _currentPage;

	set currentPage(int newPage) {
		_currentPage = newPage;
		_pageController.animateToPage(newPage, duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
		notifyListeners();
	}

	PageController get pageController => _pageController;

}