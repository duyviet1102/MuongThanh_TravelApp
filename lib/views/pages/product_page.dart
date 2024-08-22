
import 'package:flutter/material.dart';
import 'package:htx_mh/utills/responsives/dimentions.dart';
import 'package:htx_mh/utills/text/big_text.dart';
import 'package:htx_mh/utills/text/middle_text.dart';
import 'package:htx_mh/viewmodels/products_view_model.dart';

import '../../models/product_model.dart';
import '../../resources/colors.dart';
import '../widgets/custom_widgets/custom_search.dart';
import '../widgets/item_widgets/product_items.dart';
import '../widgets/navigations_menu.dart';
import '../widgets/productpage_widgets/all_product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key,}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  int current = 0;
  final List<Widget> _texts = [
    MiddleText(text: "Tất cả",),
    MiddleText(text: "Đặc sản",),
    MiddleText(text: "Thổ cẩm",),
    MiddleText(text: "Hoa Quả",),
    MiddleText(text: "Đồ uống",),
    MiddleText(text: "Đồ thủ công",),
  ];

  late List<List<Widget>> _pages;
  final ProductViewModel _productViewModel = ProductViewModel();
  List<ProductModel> products = [];
  // CustomSearchTest searchDelegate = ProductSearch(productViewModel: ProductViewModel());

  @override
  void initState() {
    super.initState();
    _pages = List.generate(
      _texts.length,
          (index) => _getProductsByCategory(index),
    );
  }

  List<Widget> _getProductsByCategory(int categoryIndex) {
    List<ProductModel> productList;
    switch (categoryIndex) {
      case 0:
        return [const AllProducts()];
      case 1:
        productList = _productViewModel.createDacSan;
        break;
      case 2:
        productList = _productViewModel.createThoCam;
        break;
      case 3:
        productList = _productViewModel.createHoaQua;
        break;
      case 4:
        productList = _productViewModel.createDoUong;
        break;
      case 5:
        productList = _productViewModel.createDoThuCong;
        break;
      default:
        return [];
    }

    return productList
        .map(
          (product) => ProductItemsList(
        product: product,
        containerWidth: Dimentions.width180,
        marginRight: 1,
        fontSize: Dimentions.font18,
      ),
    )
        .toList();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: wColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: Dimentions.height40*2,
        title: Padding(
          padding: EdgeInsets.only(top: Dimentions.height10),
          child: Column(
            children: [
              BigText(text: "Sản Phẩm", color: wColor,size: Dimentions.font10*3,),
              MiddleText(text: "tại HTX Mường Hoa", color: wColor, size: Dimentions.font18,),
            ],
          ),
        ),
        backgroundColor: mainColor,
        leading: IconButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NavigationMenu()), // Chuyển hướng đến trang ProductPage
                  );
                },
                icon: Icon(Icons.arrow_back, size: Dimentions.height30, color: wColor,),
        ),
        actions: [
          IconButton(
              onPressed: (){
                showSearch(
                    context: context,
                    delegate: CustomSearch(productViewModel: _productViewModel));
              },
              icon: Icon(Icons.search_rounded, size: Dimentions.height30, color: wColor,))
        ],
      ),
      body: Column(
        children: [
          buildTapBar(),
          buildBody()
        ],
      ),
    );
  }

  Widget buildTapBar() => Container(
    color: Colors.transparent,
    margin: EdgeInsets.symmetric(horizontal: Dimentions.width10, vertical: Dimentions.height10/2),
    width: MediaQuery.of(context).size.width,
    child: SizedBox(
      height: Dimentions.height35*2,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: _texts.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    setState((){
                      current = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: Dimentions.width10/2, vertical: Dimentions.height10/2),
                    width: Dimentions.width50*2,
                    height: Dimentions.height40,
                    decoration: BoxDecoration(
                      color: current == index
                          ? const Color(0xFFb3d89c).withOpacity(0.5)
                          : wColor,
                      border: Border.all(
                          color: const Color(0xFF3f7d20),
                          strokeAlign: BorderSide.strokeAlignInside,
                          width: Dimentions.width10/5,
                          style: BorderStyle.solid
                      ),
                      borderRadius: BorderRadius.circular(Dimentions.radius10),
                      boxShadow:[
                        current == index
                            ? BoxShadow(
                          color: const Color(0xFFb3d89c).withOpacity(0.5),
                          blurRadius: 4,
                          offset: const Offset(0, 6),
                          spreadRadius: 0,
                        )
                            : const BoxShadow(color: Colors.transparent),
                      ]
                    ),
                    child: Center(
                      child: _texts[index],
                    ),
                  ),
                ),
                Visibility(
                    visible: current == index,
                    child: Container(
                      height: Dimentions.height30/5,
                      width: Dimentions.width30/5,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: bColor
                      ),
                    ),
                )
              ],
            );
          }
      ),
    ),
  );

  Widget buildBody() => Expanded(
    child: _pages[current].isEmpty ? const SizedBox() : current == 0 ? SingleChildScrollView(
      child: Column(
        children: _pages[current],
      ),
    ) :
    GridView.builder(
        itemCount: _pages[current].length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.82
        ),
        itemBuilder: (BuildContext context, int index){
          return Container(
              margin: EdgeInsets.symmetric(horizontal: Dimentions.width10, vertical: Dimentions.height10),
              child: _pages[current][index]
          );
        }
    ),
  );

}
