import 'package:real_estate_emtalik/features/home/domain/entities/home_data.dart';

abstract interface class HomeRepository {
  Future<HomeData> fetchHome();
}
