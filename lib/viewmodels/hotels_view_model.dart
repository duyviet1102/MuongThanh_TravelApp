import 'package:htx_mh/data/hotel_data.dart';
import 'package:htx_mh/models/hotel_model.dart';

class HotelViewModel {
  List<HotelModel> createHotels = HotelData.getHotel(1);
  // List<ProductModel> createProducts2 = ProductData.getProducts(2);
  // List<ProductModel> createProducts3 = ProductData.getProducts(3);

  List<HotelModel> getAllHotel() {
    List<HotelModel> allHotels = [];
    allHotels.addAll(createHotels);
    // allProducts.addAll(createProducts2);
    // allProducts.addAll(createProducts3);
    return allHotels;
  }
}
