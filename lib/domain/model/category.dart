

import 'package:equatable/equatable.dart';

class Category extends Equatable{
  final String? Id;
  final String? name;
  final String? slug;
  final String? image;

  @override
  List<Object?> get props => [Id];

  Category ({
    this.Id,
    this.name,
    this.slug,
    this.image,
  });

}