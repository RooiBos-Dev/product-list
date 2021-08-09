import 'package:flutter/material.dart';
import 'package:product_list/model/product/product.dart';
import 'package:product_list/screens/product/productCard.dart';

class ProductList extends StatefulWidget {
  final List<Product>? products;
  const ProductList({required Key key, this.products}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.products!.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return ProductCard(
          key: Key('product$index'),
          product: widget.products![index],
        );
      },
    );
  }
}
