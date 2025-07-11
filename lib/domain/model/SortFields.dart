import 'package:json_annotation/json_annotation.dart';

enum SortFields{
  @JsonValue("price")
  price,
  @JsonValue("createdAt")
  newest
}