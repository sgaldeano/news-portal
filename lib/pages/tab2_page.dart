import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s17_news_portal/models/category.dart';
import '../models/models.dart';
import '../services/services.dart' show NewsServices;
import '../themes/app_theme.dart';
import '../widgets/widgets.dart' show NewsList;

class Tab2Page extends StatefulWidget {

	const Tab2Page({super.key});

  @override
  State<Tab2Page> createState() => _Tab2PageState();

}

class _Tab2PageState extends State<Tab2Page> with AutomaticKeepAliveClientMixin {

	@override
	Widget build(BuildContext context) {
	  super.build(context);

		final articles = Provider.of<NewsServices>(context).selectedCategoryArticles;

  	return SafeArea(
  	  child: Scaffold(
    		body: Column(
					children: [
						const _CategoriesBar(),

						Expanded(
							child: articles.isNotEmpty
								? NewsList(articles)
								: const Center(
										child: CircularProgressIndicator()
									)
						)
					],
				)
			),
  	);
	}

  @override
  bool get wantKeepAlive => true;
}

class _CategoriesBar extends StatelessWidget {

	const _CategoriesBar();

  @override
  Widget build(BuildContext context) {

		final categories = Provider.of<NewsServices>(context).categories;

    return SizedBox(
			width: double.infinity,
			height: 82,
      child: ListView.builder(
			itemCount: categories.length,
			physics: const BouncingScrollPhysics(),
			scrollDirection: Axis.horizontal,
      	itemBuilder: (_, index) {
				final String categoryName = categories[index].name;

				return Container(
					width: 114,
					padding: const EdgeInsets.all(8),
					child: Column(
						children: [
							_CategoryButton(categories[index]),
							const SizedBox(height: 8),
							Text('${categoryName[0].toUpperCase()}${categoryName.substring(1)}')
						]
					)
				);
      	}
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {

	final Category category;

	const _CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
		final NewsServices newsServices = Provider.of<NewsServices>(context);

    return GestureDetector(
			onTap: () {
				newsServices.selectedCategory = category.name;
			},
      child: Container(
			width: 40,
			height: 40,
			decoration: const BoxDecoration(
				shape: BoxShape.circle,
				color: Colors.white
			),
			child: Icon(category.icon,
				color: newsServices.selectedCategory != category.name
					? Colors.black54
					: appTheme.colorScheme.secondary
			),
		),
    );
  }
}