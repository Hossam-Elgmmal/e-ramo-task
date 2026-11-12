import 'package:flutter/material.dart';
import 'package:real_estate_emtalik/core/constants/app_strings.dart';
import 'package:real_estate_emtalik/core/router/app_router.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/news_item.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/horizontal_card_list.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/news_card.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/section_header.dart';

/// "اهم الأخبار".
class NewsSection extends StatelessWidget {
  const NewsSection({super.key, required this.news});

  final List<NewsItem> news;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          title: AppStrings.newsTitle,
          onViewAll: () => context.pushPlaceholder(AppStrings.newsTitle),
        ),
        const SizedBox(height: 25),
        HorizontalCardList(
          height: 257,
          itemCount: news.length,
          itemBuilder: (context, index) => NewsCard(
            item: news[index],
            onTap: () => context.pushPlaceholder(news[index].title),
          ),
        ),
      ],
    );
  }
}
