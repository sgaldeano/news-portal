import 'package:flutter/material.dart';
import 'package:s17_news_portal/themes/app_theme.dart';
import '../models/news_models.dart';

class NewsList extends StatelessWidget {

  final List<Article> articles;

  const NewsList(
    this.articles,
    {
      Key? key
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (_, index) {
        return _News(article: articles[index], index: index);
      }
    );
  }

}

class _News extends StatelessWidget {

  final Article article;
  final int index;

  const _News({
    required this.article,
    required this.index,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 6),

        _CardTopBar(article: article, index: index),

        _CardTitle(article),

        _CardImage(article.urlToImage),

        _CardBody(article.description),

        const _CardButtons(),

        const SizedBox(height: 14),

        const Divider(thickness: 2)
      ],
    );
  }

}

class _CardTopBar extends StatelessWidget {

  final Article article;
  final int index;

  const _CardTopBar({
    required this.article,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: article.author != ''
        ? Row(
            children: [
              Text('${index + 1} ', style: TextStyle(color: appTheme.colorScheme.secondary)),
              Text(article.author!)
            ],
          )
        : const SizedBox()
    );
  }

}

class _CardTitle extends StatelessWidget {

  final Article article;

  const _CardTitle(
      this.article
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(article.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
    );
  }

}

class _CardImage extends StatelessWidget {

  final String? imageUrl;

  const _CardImage(
    this.imageUrl
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: (imageUrl != null)
        ? FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            image: NetworkImage(imageUrl!),
          )
        : const Image(
          image: AssetImage('assets/no_image.png')
        ),
    );
  }

}

class _CardBody extends StatelessWidget {

  final String? description;

  const _CardBody(
    this.description
  );

  @override
  Widget build(BuildContext context) {
    if ((description != null)) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(description!)
      );
    } else {
      return const SizedBox(height: 8);
    }
  }

}

class _CardButtons extends StatelessWidget {

  const _CardButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed: () {

          },
          fillColor: appTheme.colorScheme.secondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.star_border)
        ),

        const SizedBox(width: 20),

        RawMaterialButton(
          onPressed: () {

          },
          fillColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.share)
        )
      ],
    );
  }

}