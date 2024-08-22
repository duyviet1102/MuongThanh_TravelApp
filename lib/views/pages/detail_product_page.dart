

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:htx_mh/data/db_helper.dart';
import 'package:htx_mh/data/products_data.dart';
import 'package:htx_mh/models/cart_model.dart';
import 'package:htx_mh/models/product_model.dart';
import 'package:htx_mh/resources/colors.dart';
import 'package:htx_mh/utills/responsives/dimentions.dart';
import 'package:htx_mh/utills/text/big_text.dart';
import 'package:htx_mh/utills/text/middle_text.dart';
import 'package:htx_mh/utills/text/small_text.dart';
import 'package:htx_mh/viewmodels/provider/cart_provider.dart';
import 'package:htx_mh/views/widgets/custom_widgets/expandable_text_widget.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/item_widgets/product_items.dart';


class DetailProductPage extends StatefulWidget {
  final ProductModel product;
  final String data;

  const DetailProductPage({Key? key,
    required this.product,
    required this.data
  }) : super(key: key);

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  final ScrollController _controller = ScrollController();
  bool _isScrolled = false;
  DBHelper? dbHelper = DBHelper();

  ProductData dataProduct = ProductData();
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _controller.offset;
    if (offset > kToolbarHeight + Dimentions.height40*3) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      bottomNavigationBar: buildBottomBar(),
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          buildSlidePic(),
          buildBody(),
        ]
      ),
    );
  }

  Widget buildSlidePic() => SliverAppBar(
    centerTitle: true,
    leading: IconButton(
        onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: _isScrolled ? bColor : wColor, size: Dimentions.height30,)),
    actions: [
        Padding(
          padding: EdgeInsets.only(right: Dimentions.width10),
          child: IconButton(
            onPressed: () {},
            icon: Center(
                child: Badge(
                  label: Consumer<CartProvider>(
                    builder: (context, value, child){
                      return SmallText(text: value.getCounter().toString(), color: wColor,);
                    },
                  ),
                    child: Icon(Icons.shopping_cart_outlined, color: _isScrolled ? bColor : wColor, size: Dimentions.height25,))),
          ),
        ),
      ],
    pinned: true,
    expandedHeight: Dimentions.height50*5,
    toolbarHeight: Dimentions.height50,
    title: BigText(text: "Chi tiết sản phẩm", size: Dimentions.font24 ,color: _isScrolled ? bColor : wColor,),
    flexibleSpace: FlexibleSpaceBar(
      background: Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: Dimentions.height50*5,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) => setState(() => activeIndex = index),
            ),
            itemCount: dataProduct.imageDetail.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              final image = dataProduct.imageDetail[index];
              return buildImage(image, index);
            },
          ),
          SizedBox(height: Dimentions.height10,),
          buildIndicator(),
        ],
      ),
    ),
  );

  Widget buildBody() => SliverToBoxAdapter(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: Dimentions.width10, vertical: Dimentions.height15),
          padding: EdgeInsets.only(left: Dimentions.width10, top: Dimentions.height10/2, bottom: Dimentions.height10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(Dimentions.radius10)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: widget.product.name, size: Dimentions.font20,),
              MiddleText(text: widget.product.price.toString() + ' ₫', size: Dimentions.font18, color: redColor,),
              MiddleText(text: "Nhãn hiệu: ${widget.product.category}", size: Dimentions.font18,),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: Dimentions.width10),
          padding: EdgeInsets.only(left: Dimentions.width10, top: Dimentions.height10/2, bottom: Dimentions.height10, right: Dimentions.width10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(Dimentions.radius10)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MiddleText(text: "Giới thiệu:", size: Dimentions.font20),
              SizedBox(
                height: Dimentions.height50*4,
                child: SingleChildScrollView(
                  child: ExpandableTextWidget(text: widget.product.description),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: Dimentions.height20, bottom: Dimentions.height10),
          color: Color(0xFFEEEEEE),
          height: Dimentions.height30*2,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: Dimentions.width15),
                height: Dimentions.height10/5, width: Dimentions.width35*2, color: Color(0xFF8a817c),),
              MiddleText(text: "Sản phẩm liên quan", size: Dimentions.font20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Dimentions.width15),
                height: Dimentions.height10/5, width: Dimentions.width35*2, color: Color(0xFF8a817c),),
            ],
          ),
        ),
        SizedBox(
          height: Dimentions.height50*5,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: productData.nameProducts.length,
              itemBuilder: (context, index){
                EdgeInsets margin = EdgeInsets.zero;
                if (index == 0) {
                  margin = EdgeInsets.only(left: Dimentions.width15);
                }
                return Container(
                    margin: margin,
                    child: ProductItemsList(product: widget.product,)
                );
              }),
        )
      ],
    ),
  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: 5,
    effect: WormEffect(
      activeDotColor: bColor,
      dotColor: greyColor,
      dotHeight: Dimentions.height10,
      dotWidth: Dimentions.width10,
    ),
  );

  Widget buildImage(Image image, int index) => SizedBox(
    width: double.infinity,
    child: dataProduct.imageDetail[index],
  );

  Widget buildBottomBar() => Container(
    height: Dimentions.height50*2,
    decoration: BoxDecoration(
        color: const Color(0xffe6e4e0),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimentions.radius10*3), topRight: Radius.circular(Dimentions.radius10*3) )
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: Dimentions.width25),
          height: Dimentions.height50,
          decoration: BoxDecoration(
              color: wColor,
              borderRadius: BorderRadius.circular(Dimentions.radius10)
          ),
          child: Row(
            children: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.remove, size: Dimentions.height25,)
              ),
              MiddleText(text:"0", size: Dimentions.font20,),
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.add, size: Dimentions.height25,),
              )
            ],
          ),
        ),
        InkWell(
          onTap: (){
            int index = 0;
            List<ProductModel> allProducts = [];

            for (int i = 1; i <= 3; i++) {
              allProducts.addAll(ProductData.getProducts(i));
            }
            if(allProducts.isNotEmpty){
              ProductModel product = allProducts[index];
              print("Số lượng sản phẩm: ${allProducts.length}");
              dbHelper!.insert(
                  CartModel(
                      id: index,
                      productId: index.toString(),
                      productName: product.name.toString(),
                      initialPrice: product.price,
                      productPrice: product.price,
                      quantity: 1,
                      unitTag: product.name.toString(),
                      image: product.name.toString()
                  )
              ).then((value){
                print("Product is added");
                final cart = Provider.of<CartProvider>(context);
                cart.addTotalPrice(double.parse(product.price.toString()));
                cart.addCounter();
              }).onError((error, stackTrace) {
                print(error.toString());
              });
            }else{
              print("Danh sách trống");
              print(index);
            }
           
          },
          child: Container(
            margin: EdgeInsets.only(right: Dimentions.width15),
            width: Dimentions.width45*3,
            height: Dimentions.height35*2,
            decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(Dimentions.radius10*2)
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: Dimentions.height35,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: wColor,
                        width: 1
                      )
                    )
                  ),
                  child: Center(child: MiddleText(text: "80.000.000" + "₫", size: Dimentions.font18, color: wColor,)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Dimentions.height10/2),
                  child: BigText(text: "Add to cart", color: wColor, size: Dimentions.font18,),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}