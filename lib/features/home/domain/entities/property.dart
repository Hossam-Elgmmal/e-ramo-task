import 'package:equatable/equatable.dart';

enum ListingType { sale, rent }

/// Tab filter shown above each property list ("الكل | للبيع | للإيجار").
enum ListingFilter {
  all,
  sale,
  rent;

  List<Property> apply(List<Property> items) {
    return switch (this) {
      ListingFilter.all => items,
      ListingFilter.sale =>
        items.where((p) => p.type == ListingType.sale).toList(),
      ListingFilter.rent =>
        items.where((p) => p.type == ListingType.rent).toList(),
    };
  }
}

class Property extends Equatable {
  const Property({
    required this.id,
    required this.title,
    required this.price,
    required this.type,
    required this.areaSqft,
    required this.bathrooms,
    required this.bedrooms,
    required this.location,
    required this.postedAgo,
    required this.imageAsset,
    this.isFeatured = false,
  });

  final String id;
  final String title;
  final int price;
  final ListingType type;
  final int areaSqft;
  final int bathrooms;
  final int bedrooms;
  final String location;
  final String postedAgo;
  final String imageAsset;
  final bool isFeatured;

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        type,
        areaSqft,
        bathrooms,
        bedrooms,
        location,
        postedAgo,
        imageAsset,
        isFeatured,
      ];
}
