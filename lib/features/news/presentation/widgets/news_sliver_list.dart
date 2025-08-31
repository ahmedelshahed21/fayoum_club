import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:fayoum_club/features/news/presentation/widgets/news_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsSliverList extends StatelessWidget {
  final List<NewsItem> news;

  const NewsSliverList({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: news.length,
        (context, index) => NewsTile(news: news[index]),
      ),
    );
  }
}
