import 'package:equatable/equatable.dart';

class NewsItem extends Equatable {
  const NewsItem({
    required this.id,
    required this.title,
    required this.body,
    required this.imageAsset,
  });

  final String id;
  final String title;
  final String body;
  final String imageAsset;

  @override
  List<Object?> get props => [id, title, body, imageAsset];
}
