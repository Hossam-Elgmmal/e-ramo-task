import 'package:equatable/equatable.dart';

class PromoBanner extends Equatable {
  const PromoBanner({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.actionLabel,
    required this.imageAsset,
  });

  final String id;
  final String title;
  final String subtitle;
  final String actionLabel;
  final String imageAsset;

  @override
  List<Object?> get props => [id, title, subtitle, actionLabel, imageAsset];
}
