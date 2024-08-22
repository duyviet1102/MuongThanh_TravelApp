class CartModel{
  late final int? id;
    late String? productId;
    late String? productName;
    late int? initialPrice;
    late int? productPrice;
    late int? quantity;
    late String? unitTag;
    late String? image;

  CartModel({
    required this.id,
    required this.productId,
    required this.productName,
    required this.initialPrice,
    required this.productPrice,
    required this.quantity,
    required this.unitTag,
    required this.image
  });

  CartModel.fromMap(Map<dynamic, dynamic> res) :
        id = res["id"],
        productId = res["productId"],
        productName = res["productName"],
        initialPrice = res["initialPrice"],
        productPrice = res["productPrice"],
        quantity = res["quantity"],
        unitTag = res["unitTag"],
        image = res["image"];

  Map<String, Object?> toMap(){
    return{
      'id' : id,
      'productId' : productId,
      'productName' : productName,
      'initialPrice' : initialPrice,
      'productPrice' : productPrice,
      'quantity' : quantity,
      'unitTag' : unitTag,
      'image' : image,
    };
  }
}