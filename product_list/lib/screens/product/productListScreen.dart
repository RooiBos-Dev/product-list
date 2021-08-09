import 'package:flutter/material.dart';
import 'package:product_list/model/product/product.dart';
import 'package:product_list/screens/product/productList.dart';
import 'package:product_list/service/productService.dart';
import 'package:product_list/theme/colours.dart';

class ProductListSceen extends StatefulWidget {
  final String? sessionId;

  ProductListSceen({
    required Key key,
    this.sessionId,
  }) : super(key: key);

  @override
  _ProductListSceenState createState() => _ProductListSceenState();
}

class _ProductListSceenState extends State<ProductListSceen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Product> _productList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _loadData();
  }

  Future<void> _loadData() async {
    if (widget.sessionId != null) {
      _productList =
          await ProductService.instance.getProductList(widget.sessionId!);
    }

    setState(() {
      isLoading = false;
    });
  }

  Widget _buildProductList() {
    return ProductList(key: Key('product_list'), products: _productList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colours.lightgrey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colours.black),
        backgroundColor: Colours.white,
        toolbarHeight: 100,
        title: Text(
          'Yours Products',
          // TODO: ADD STYLING
        ),
      ),
      body: _buildProductList(),
    );
  }
}
