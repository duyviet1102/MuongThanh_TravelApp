import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:htx_mh/models/product_model.dart';
import 'package:htx_mh/utills/responsives/dimentions.dart';

import '../../../viewmodels/products_view_model.dart';
import '../../pages/detail_product_page.dart';

class CustomSearch extends SearchDelegate{
  final ProductViewModel productViewModel; // Instance of ProductViewModel

  CustomSearch({required this.productViewModel});
  List<String> getAllProductNames() {
    List<ProductModel> allProducts = productViewModel.getAllProducts();
    return allProducts.map((product) => product.name).toList();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
          onPressed: (){
            query = "";
          },
          icon: Icon(Icons.clear, size: Dimentions.height25,))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, null);
        },
        icon: Icon(Icons.arrow_back, size: Dimentions.height25,));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: TextStyle(fontSize: Dimentions.font20*5, fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<String> suggestions = getAllProductNames().where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).take(5).toList();

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index){
          final suggest = suggestions[index];
          List<ProductModel> allProducts = productViewModel.getAllProducts();
            ProductModel? selectedProduct = allProducts.firstWhereOrNull(
            (product) => product.name == suggest,
          );
            if (selectedProduct != null) {
              return ListTile(
                title: Text(suggest),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailProductPage(data: suggest, product: selectedProduct),
                    ),
                  );
                },
              );
          }
          return const SizedBox(); // Trả về widget rỗng nếu không tìm thấy sản phẩm
        }
      ),
    );
  }
}