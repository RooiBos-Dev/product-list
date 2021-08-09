import 'package:product_list/model/base.dart';

class ProductDetail extends BaseModel {
  final String? name;
  final String? summary;
  final String? description;
  final String? logo;
  final List<String>? gallery;

  const ProductDetail({
    id,
    this.name,
    this.summary,
    this.description,
    this.logo,
    this.gallery,
  }) : super(id);

  factory ProductDetail.fromJson(dynamic json) {
    return ProductDetail(
      id: json['id'],
      name: json['name'] != null ? json["name"] : null,
      summary: json['summary'] != null ? json["summary"] : null,
      description: json['description'] != null ? json["description"] : null,
      gallery: json['gallery'].length > 0
          ? List.from(json['gallery'].map((g) => g))
          : null,
    );
  }
}
