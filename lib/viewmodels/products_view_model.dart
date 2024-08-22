import '../data/products_data.dart';
import '../models/product_model.dart';

class ProductViewModel {
  List<ProductModel> createDacSan = ProductData.getProducts(1);
  List<ProductModel> createThoCam = ProductData.getProducts(2);
  List<ProductModel> createHoaQua = ProductData.getProducts(3);
  List<ProductModel> createDoUong = ProductData.getProducts(4);
  List<ProductModel> createDoThuCong = ProductData.getProducts(5);

  List<ProductModel> getAllProducts() {
    List<ProductModel> allProducts = [];
    allProducts.addAll(createDacSan);
    allProducts.addAll(createThoCam);
    allProducts.addAll(createHoaQua);
    allProducts.addAll(createDoUong);
    allProducts.addAll(createDoThuCong);
    return allProducts;
  }
}

