import 'package:product_list/model/base.dart';

class Product extends BaseModel {
  final String? name;
  final String? summary;
  final String? logo;

  const Product({
    id,
    this.name,
    this.summary,
    this.logo,
  }) : super(id);

  factory Product.fromJson(dynamic json) {
    return Product(
      id: json['id'],
      name: json['name'] != null ? json["name"] : null,
      summary: json['summary'] != null ? json["summary"] : null,
      logo: json['logo'] != null ? json["logo"] : null,
    );
  }
}
