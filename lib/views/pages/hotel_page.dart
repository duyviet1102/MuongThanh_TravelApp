
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:htx_mh/utills/text/big_text.dart';
import 'package:htx_mh/utills/text/middle_text.dart';
import 'package:htx_mh/utills/text/small_text.dart';
import 'package:htx_mh/viewmodels/hotels_view_model.dart';
import 'package:htx_mh/views/pages/home_page.dart';
import 'package:htx_mh/views/widgets/hotel_page_widgets/app_bar_hotel_page.dart';
import 'package:htx_mh/views/widgets/navigations_menu.dart';

import '../../resources/app_assets.dart';
import '../../resources/colors.dart';
import '../../utills/responsives/dimentions.dart';
import '../widgets/item_widgets/homestay_items.dart';

class HotelPage extends StatefulWidget {
  HotelPage({Key? key}) : super(key: key);

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  final HotelViewModel hotelViewModel = HotelViewModel();
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset > kToolbarHeight + Dimentions.height40 * 5) {
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
    return Scaffold(
      backgroundColor: bgrMainColor,
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          buildAppBar(),
          buildItem()
        ],
      ),
    );
  }

  Widget buildAppBar() => SliverAppBar(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: _isScrolled ? Brightness.dark : Brightness.light,
    ),
    title:  BigText(text: "Trang chủ", color: _isScrolled ? bColor : wColor,),
    leading: IconButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const NavigationMenu()),);
      }, 
      icon: Icon(Icons.arrow_back,size: Dimentions.height25, color: _isScrolled ? bColor : wColor, ),),
    automaticallyImplyLeading: false,
    elevation: 0,
    floating: true,
    stretch: true,
    pinned: true,
    backgroundColor: wColor,
    expandedHeight: Dimentions.height50*8,
    toolbarHeight: Dimentions.height50,
    flexibleSpace: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool isTitleVisible = constraints.maxHeight > kToolbarHeight + Dimentions.height40*5;
        return PreferredSize(
          preferredSize: Size.fromWidth(Dimentions.width50*3),
          child: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.zoomBackground,
            ],
            title:  AnimatedOpacity(
              opacity: isTitleVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 0), // Thời gian làm mờ
              child: const AppBarHotelPage(),
            ),
            centerTitle: true,
            titlePadding: EdgeInsets.only(top: Dimentions.height20 * 2),
            background: Stack(
              children: [
                Positioned.fill(
                  bottom: Dimentions.height45*5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimentions.radius10*2), bottomRight: Radius.circular(Dimentions.radius10*2)),
                      child: Image.asset(AppAssets.imgBanner, fit: BoxFit.cover)
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );

  Widget buildItem() => SliverPadding(
    padding: EdgeInsets.only(left: Dimentions.width15, right: Dimentions.width15, bottom: Dimentions.height15),
    sliver: SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 12,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          childAspectRatio: 0.69
        ),
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return HomeStayItems(
              hotelModel: hotelViewModel.createHotels[index],
            widthContainer: Dimentions.width10*14.5,
            marginRight: 1,
          );
        },
        childCount: hotelViewModel.createHotels.length,
      ),
    ),
  );
}
