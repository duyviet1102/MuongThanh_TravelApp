import 'package:flutter/material.dart';
import 'package:htx_mh/viewmodels/products_view_model.dart';
import '../../../utills/responsives/dimentions.dart';
import '../../../utills/text/big_text.dart';
import '../item_widgets/product_items.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key,}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductState();
}

class _AllProductState extends State<AllProducts> {
  final ProductViewModel _productViewModel =  ProductViewModel();

  final List<String> textCategories = [
    "Các sản phẩm tiêu biểu",
    "Đặc sản Mường Hoa",
    "Trang phục thổ cẩm",
    "Hoa quả bốn mùa",
    "Đồ uống",
    "Đồ thủ công",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: textCategories
            .map((textCategories) => buildCategoryProduct(textCategories))
            .toList(),
      ),
    );
  }

  Widget buildCategoryProduct(String category) {
    List<ProductItemsList> productsList;
    switch (category) {
      case "Các sản phẩm tiêu biểu":
        productsList = _productViewModel.getAllProducts()
            .map((product) => ProductItemsList(product: product))
            .toList();
        break;
      case "Đặc sản Mường Hoa":
        productsList = _productViewModel.createDacSan
            .map((product) => ProductItemsList(product: product))
            .toList();
        break;
      case "Trang phục thổ cẩm":
        productsList = _productViewModel.createThoCam
            .map((product) => ProductItemsList(product: product))
            .toList();
        break;
        case "Hoa quả bốn mùa":
        productsList = _productViewModel.createHoaQua
            .map((product) => ProductItemsList(product: product))
            .toList();
        break;
        case "Đồ uống":
        productsList = _productViewModel.createDoUong
            .map((product) => ProductItemsList(product: product))
            .toList();
        break;
        case "Đồ thủ công":
        productsList = _productViewModel.createDoThuCong
            .map((product) => ProductItemsList(product: product))
            .toList();
        break;
      default:
        productsList = [];
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: Dimentions.width15),
          child: BigText(text: category, size: Dimentions.font10*2.2),
        ),
        SizedBox(
          height: Dimentions.height50 * 5,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: productsList.length,
              itemBuilder: (context, index) {
                final productItem  = productsList[index];
                EdgeInsets margin = EdgeInsets.zero;
                if (index == 0) {
                  margin = EdgeInsets.only(left: Dimentions.width15);
                }
                return Container(
                  margin: margin,
                  child: productItem,
                );
              }),
        ),
      ],
    );
  }
}

