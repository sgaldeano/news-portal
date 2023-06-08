import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class NewsServices with ChangeNotifier {

  final String _baseUrl = 'newsapi.org';
  final String _apiKey = 'ADD_YOUR_newsapi.org_API_KEY_HERE';
  final String _country = 'ar';

  static const String business = 'business';
  static const String entertainment = 'entertainment';
  static const String general = 'general';
  static const String health = 'health';
  static const String science = 'science';
  static const String sports = 'sports';
  static const String technology = 'technology';

  List<Article> headlines = [];
  final Map<String, List<Article>> _categoryArticles = {};

  String _selectedCategory = business;
  List<Category> categories = [
    Category(name: business, icon: FontAwesomeIcons.building),
    Category(name: entertainment, icon: FontAwesomeIcons.tv),
    Category(name: general, icon: FontAwesomeIcons.addressCard),
    Category(name: health, icon: FontAwesomeIcons.headSideVirus),
    Category(name: science, icon: FontAwesomeIcons.vials),
    Category(name: sports, icon: FontAwesomeIcons.volleyball),
    Category(name: technology, icon: FontAwesomeIcons.memory)
  ];

  NewsServices() {
    getTopHeadlines();
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String selectedCategory) {
    _selectedCategory = selectedCategory;
    notifyListeners();
  }

  List<Article> get selectedCategoryArticles {
    if (!_categoryArticles.containsKey(_selectedCategory)) {
      Future.delayed(const Duration(milliseconds: 300), () => getArticlesByCategory());
      return [];
    }

    return _categoryArticles[_selectedCategory]!;
  }

  Future getTopHeadlines() async {
    final url = Uri.https(_baseUrl, '/v2/top-headlines', {
        'apiKey' : _apiKey,
        'country': _country
      }
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final NewsResponse newsResponse = newsResponseFromJson(response.body);
      headlines.addAll(newsResponse.articles);
      notifyListeners();
    }
  }

  Future getArticlesByCategory() async {
    final url = Uri.https(_baseUrl, '/v2/top-headlines', {
        'apiKey': _apiKey,
        'country': _country,
        'category': selectedCategory
      }
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final NewsResponse newsResponse = newsResponseFromJson(response.body);
      _categoryArticles[selectedCategory] = (newsResponse.articles);
    }

    notifyListeners();
  }

}