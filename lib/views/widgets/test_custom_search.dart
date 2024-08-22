// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:htx_mh/models/product_model.dart';
// import 'package:htx_mh/viewmodels/products_view_model.dart';
//
// import '../pages/detail_product_page.dart';
//
// abstract class CustomSearchTest {
//   List<String> getSuggestions(String query);
//   Widget buildSearchResult(BuildContext context, String suggestion);
// }
//
// class ProductSearch extends CustomSearchTest {
//   final ProductViewModel productViewModel;
//
//   ProductSearch({required this.productViewModel});
//
//   @override
//   List<String> getSuggestions(String query) {
//     List<ProductModel> allProducts = productViewModel.getAllProducts();
//     return allProducts
//         .where((product) => product.productName.toLowerCase().contains(query.toLowerCase()))
//         .map((product) => product.productName)
//         .toList();
//   }
//
//   @override
//   Widget buildSearchResult(BuildContext context, String suggestion) {
//     List<ProductModel> allProducts = productViewModel.getAllProducts();
//     ProductModel? selectedProduct = allProducts.firstWhereOrNull(
//           (product) => product.productName == suggestion,
//     );
//
//     if (selectedProduct != null) {
//       return ListTile(
//         title: Text(suggestion),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => DetailProductPage(data: suggestion, product: selectedProduct),
//             ),
//           );
//         },
//       );
//     } else {
//       return SizedBox(); // Trả về widget rỗng nếu không tìm thấy sản phẩm
//     }
//   }
//
//
// }
// class ProductSearchDelegate extends SearchDelegate<String> {
//   final CustomSearchTest searchDelegate;
//
//   ProductSearchDelegate({required this.searchDelegate});
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: Icon(Icons.clear),
//       ),
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: Icon(Icons.arrow_back),
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // Logic để hiển thị kết quả tìm kiếm
//     return searchDelegate.buildSearchResult(context, query);
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> suggestions = searchDelegate.getSuggestions(query);
//
//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         final suggestion = suggestions[index];
//         // Hiển thị gợi ý tìm kiếm
//         return ListTile(
//           title: Text(suggestion),
//           onTap: () {
//             // Điều hướng đến trang chi tiết sản phẩm khi người dùng chọn một gợi ý
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => DetailProductPage(data: suggestion),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
// // class NewsSearch extends CustomSearch {
// //   final NewsViewModel newsViewModel;
// //
// //   NewsSearch({required this.newsViewModel});
// //
// //   @override
// //   List<String> getSuggestions(String query) {
// //     // Logic để lấy gợi ý từ danh sách tin tức
// //     // Thay thế logic này bằng cách lấy dữ liệu từ NewsViewModel tương ứng
// //     return [];
// //   }
// //
// //   @override
// //   Widget buildSearchResult(BuildContext context, String suggestion) {
// //     // Logic để xây dựng kết quả tìm kiếm từ danh sách tin tức
// //     // Thay thế logic này bằng cách lấy dữ liệu từ NewsViewModel tương ứng
// //     return SizedBox();
// //   }
// // }
