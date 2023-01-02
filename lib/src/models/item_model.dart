import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  String id;
  @JsonKey(name: 'title')
  String itemName;
  @JsonKey(name: 'picture ')
  String imgUrl;
  String unit;
  double price;
  String description;

  ItemModel(
      {this.id = '',
      required this.description,
      required this.imgUrl,
      required this.unit,
      required this.price,
      required this.itemName});

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
