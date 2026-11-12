import 'package:equatable/equatable.dart';

class Project extends Equatable {
  const Project({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.postedAgo,
    required this.imageAsset,
  });

  final String id;
  final String name;
  final String description;
  final String location;
  final String postedAgo;
  final String imageAsset;

  @override
  List<Object?> get props =>
      [id, name, description, location, postedAgo, imageAsset];
}
