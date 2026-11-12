import 'package:equatable/equatable.dart';

class CityStats extends Equatable {
  const CityStats({
    required this.name,
    required this.forSaleCount,
    required this.forRentCount,
    required this.imageAsset,
  });

  final String name;
  final int forSaleCount;
  final int forRentCount;
  final String imageAsset;

  @override
  List<Object?> get props => [name, forSaleCount, forRentCount, imageAsset];
}
