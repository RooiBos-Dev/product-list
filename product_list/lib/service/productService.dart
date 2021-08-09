import 'dart:convert';

import 'package:product_list/constants.dart';
import 'package:product_list/model/exception/generalException.dart';
import 'package:product_list/model/product/product.dart';
import 'package:http/http.dart' as http;
import 'package:product_list/model/product/productDetail.dart';

class ProductService {
  static const ProductService instance = ProductService();

  const ProductService();

  Future<List<Product>> getProductList(String sessionId) async {
    final result = await http.get(
      Uri.parse('http://kazang-test.getsandbox.com/products'),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Session-Id": sessionId,
      },
    );

    if (result.statusCode == 200) {
      final json = jsonDecode(result.body);
      List<Product> productList =
          json.map<Product>((v) => Product.fromJson(json)).toList();

      return productList;
    } else {
      final json = jsonDecode(result.body);
      throw GeneralException(
          message: '${json['statusCode']}: ${json['title']}');
    }
  }

  Future<ProductDetail> getProductDetail(int id) async {
    final result = await http.get(
      Uri(
        path: 'http://kazang-test.getsandbox.com/products/$id',
        scheme: Constants.APISCHEMA,
        host: Constants.APIHOST,
      ),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
      },
    );

    if (result.statusCode == 200) {
      final json = jsonDecode(result.body);
      ProductDetail productDetail = ProductDetail.fromJson(json);

      return productDetail;
    } else {
      final json = jsonDecode(result.body);
      throw GeneralException(
          message: '${json['statusCode']}: ${json['title']}');
    }
  }
}
