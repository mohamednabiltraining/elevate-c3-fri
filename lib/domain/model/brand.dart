import 'package:equatable/equatable.dart';

class Brand extends Equatable{
  final String? Id;
  final String? name;
  final String? slug;
  final String? image;

  @override
  List<Object?> get props => [Id];
  Brand ({
    this.Id,
    this.name,
    this.slug,
    this.image,
  });
}
