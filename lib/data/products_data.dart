import 'dart:io';

import 'package:flutter/material.dart';
import 'package:htx_mh/resources/app_assets.dart';
import 'package:image_picker/image_picker.dart';

import '../models/product_model.dart';

class ProductData {
  static final ProductData _instance = ProductData._internal();

  List<String> nameProducts = [
    "Mũ thổ cẩm Mũ thổ cẩm okok",
    "Hoa quả",
    "Đồ thủ công",
    "Váy thổ cẩm",
    "Đồ uống",
  ];

  List<int> productPrice = [
    100,
    200,
    250,
    210,
    450,
  ];

  List<Image> imageDetail = [
    Image.asset(
      AppAssets.imgCanuong,
      fit: BoxFit.cover,
    ),
    Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
    Image.asset(AppAssets.imgLau, fit: BoxFit.cover),
    Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
    Image.asset(AppAssets.imgCanuong, fit: BoxFit.cover),
  ];

  List<Image> imgDetailDacSan = [
    Image.asset(
      AppAssets.imgCanuong,
      fit: BoxFit.cover,
    ),
    Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
    Image.asset(AppAssets.imgLau, fit: BoxFit.cover),
    Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
    Image.asset(AppAssets.imgCanuong, fit: BoxFit.cover),
  ];

  static List<ProductModel> getProducts(int index) {
    switch (index) {
      case 1:
        return _getDacSan();
      case 2:
        return _getThoCam();
      case 3:
        return _getHoaQua();
      case 4:
        return _getDoUong();
      case 5:
        return _getDoThuCong();
      default:
        return [];
    }
  }

  static List<ProductModel> _getDacSan() {
    return [
      ProductModel(
        Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
        "Cơm Lam",
        30000,
        "Đặc sản Mường Hoa",
        "Cơm lam là món ăn phổ biến nhanh gọn lẹ ở Sapa nói riêng, "
            "Tây Bắc nói chung. Gạo được vo sạch rồi cho vào ống tre,"
            " nứa rồi đổ nước dừa vào. Ống cơm lam được nướng trên bếp than, củi. Khi chín cơm dẻo, "
            "thơm có mùi của tre mới, khi ăn có vị ngọt của nước dừa, "
            "có thể nói đây là món ăn ngon tuyệt vời đáng để thưởng thức. Thời tiết lạnh, cơm luôn được giữ ấm trong ống tre, bạn có thể mua về làm quà hoặc mua để ăn trên đường đi.",
      ),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Thịt trâu gác bếp",
          500000,
          "Đặc sản Mường Hoa",
          "Món thịt trâu gác bếp đã không còn quá xa lạ khi nhắc đến, "
              "để làm lên một món thịt trâu gác bếp ngon, đậm đà,"
              " người Mông sẽ chọn những phần thịt nạc vai hoặc lưng của con trâu, "
              "loại bỏ đi những phần mỡ, để món ăn được mềm hơn. "
              "Sau khi mang rửa sạch xong sẽ đem đi tẩm ướp với nhiều loại gia vị như muối hột, "
              "lá mắc khén giá nhỏ, ớt, hạt chuối rừng và rất nhiều gia vị khác."
              " Cuối cùng sẽ mang thịt treo lên gác bếp hun khói cho đến khi miếng thịt khô lại và có màu đen óng bắt mắt. "
              "Khói bếp sẽ giúp thịt được bảo quản lâu hơn và mang một mùi vị đặc trưng khi hun khói. "
              "Để tăng độ ngon cho món ăn hơn du khách sẽ ăn kèm thịt cùng với chanh và bạn có thể xé từng miếng nhỏ để ăn sẽ khiến bạn nhớ mãi hương vị đó, "
              "khi ăn bạn sẽ cảm nhận được hương vị cay của mắc khén (một loại tiêu rừng) xen lẫn là vị chua của chanh sự kết hợp này khiến món ăn trở nên thú vị hơn,"
              " cảm nhận được độ ngọt của miếng thịt trâu ngon quên lối về"),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Lợn cắp nách",
          150000,
          "Đặc sản Mường Hoa",
          "Đến Sapa món ăn nhất định phải thử là lợn cắp nách, sở dĩ được mọi người gọi cái tên độc đáo như vậy bởi những con lợn được thả rông trên sườn núi tự kiếm ăn, chạy nhiều khoảng chừng 4 – 5kg sẽ "
              "được người dân địa phương cắp nách và đem xuống chợ phiên cuối tuần để bán. "
              "Mỗi con lợn được chế biến cẩn thận tẩm ướp gia vị đậm đà sau đó sẽ được đem đi nướng than hồng cho đến khi thấy lớp da được vàng óng bắt mắt, "
              "giòn tan nhưng vẫn giữ được vị ngon ngọt của thịt bên trong. "
              "Do được thả rông và kiếm ăn nên có độ rắn chắc, và khi ăn bạn sẽ cảm nhận được sự khác biệt với những con lợn được nuôi, "
              "vừa dai vừa mềm, mùi thơm của lá móc mật và sự đậm đà của nước chấm khiến món càng trở lên hấp dẫn hơn bao giờ hết."),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Cá suối nướng",
          50000,
          "Đặc sản Mường Hoa",
          "Cá suối nướng là một trong những món ăn nổi tiếng tại Sapa nếu bỏ qua món này bạn sẽ cảm thấy hối tiếc , khi không thử qua."
              " Được thiên nhiên ban tặng những dòng suối mát lạnh, loài cá suối có kích thước khoảng 2 – 3 ngón tay, chúng thường đi thành đàn."
              " Cá suối sau khi được bắt sẽ được đem đi chế biến, ướp gia vị đậm đà, sau đó được nướng lên than hồng, bạn sẽ không cảm nhận được vị tanh khi ăn,"
              " mà thay vào đó là hương vị tươi ngon vàng óng cho món ăn mà nhất định bạn nên thử dù chỉ một lần."),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Bánh hạt dẻ nướng",
          10000,
          "Đặc sản Mường Hoa",
          "Bánh hạt dẻ Sapa vạn người mê, những chiếc bánh thơm phức được ra lò nóng hổi, "
              "đây là một trong những món ăn được rất nhiều du khách mang về làm quà cho người thân và bạn bè khi đến thị trấn Sapa."
              " Chiếc bánh hình tròn, nhìn giống với bánh pía của miền Nam nhưng bản sẽ to và dẹt hơn."
              " Nhân bánh được làm bằng hạt dẻ xay nhuyễn, thêm một chút bơ và đậu xanh mềm tạo nên một hương vị đặc biệt. "
              "Vỏ bánh hạt dẻ được làm từ bột mì cán mỏng mịn, buổi tối đi dạo thưởng thức món bánh được nướng nóng hổi trên bếp tại phiên chợ dưới thời tiết se se lạnh thì còn gì thú vị hơn,"
              " một trải nghiệm thú vị tại vùng cao. Nếu đến Sapa chưa biết mua gì về làm quà cho người thân thì đây sẽ là sự lựa chọn đúng đắn dành cho bạn."),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Gà đen",
          200000,
          "Đặc sản Mường Hoa",
          "Ngoài những món ăn như cá hồi, thịt trâu gác bếp, bánh hạt dẻ,"
              "…thì một món không kém phần hấp dẫn chính là lẩu cá tầm cũng được rất nhiều du khách yêu thích. "
              "Cá tầm có màu trắng hồng nhẹ, vân vàng nhiều thịt và chứa nhiều chất dinh dưỡng tốt cho sức khỏe, "
              "có giá trị kinh tế cao. Thưởng thức một nồi lẩu cá tầm vào một tiết trời se se lạnh sẽ khiến bạn cảm thấy vô cùng tuyệt vời,"
              " khi ăn có vị ngọt, vị chua, cay cay hòa quyện lại , cắn một miếng cá tầm tan ra trong miệng thật thú vị, "
              "ăn kèm với rau rừng thật thú vị một món ăn không thể bỏ qua."),
    ];
  }

  static List<ProductModel> _getThoCam() {
    return [
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Khăn thổ cẩm",
          280000,
          "Thổ cẩm Mường Hoa",
          "Khăn thổ cẩm sapa, được dệt  thủ công hoàn toàn bởi các nghệ nhân dân tộc , "
              "tinh tế đến từng chi tiết và hoa văn. Chất liệu thổ cẩm mềm mại thoáng mát và sang trọng."),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Áo thổ cẩm",
          265000,
          "Thổ cẩm Mường Hoa",
          "Một sản phẩm có truyền thống lâu đời được các nghệ nhân truyền nghề lại cho đến tận bây giờ."
              " Đây là loại vải được dệt thủ công từ các sợi vải có nguồn gốc từ cây lanh, cây bông và cây gai. "
              "Bề mặt vải thổ cẩm được dệt rất chi tiết, có các ô hoa văn nổi lên như thêu bằng tay, nhưng thực chất tất cả quá trình để tạo ra tấm vải thổ cẩm đều được thực hiện trên khung cửi"),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Váy thổ cẩm",
          750000,
          "Thổ cẩm Mường Hoa",
          "Váy thổ cẩm là một tác phẩm thủ công độc đáo, được tạo ra từ vải thổ cẩm, "
              "một loại vải dệt thủ công có nguồn gốc từ cây lanh, cây bông và cây gai. "
              "Vải thổ cẩm được nhuộm từ các nguyên liệu tự nhiên như củ nghệ, cây Krung và lá chùm bầu. Màu sắc của váy thổ cẩm thường rực rỡ và đa dạng, từ màu vàng, đỏ, xanh đến đen. "
              "Hoa văn trên váy thổ cẩm thể hiện sự tinh tế và sự sáng tạo của người thợ dệt."),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Mũ thổ cẩm",
          165000,
          "Thổ cẩm Mường Hoa",
          "Mũ thổ cẩm tại Thung Lũng Mường Hoa thường là sản phẩm thủ công được làm từ vải thổ cẩm truyền thống của các dân tộc địa phương, "
              "đặc biệt là dân tộc H'Mông. Mũ thổ cẩm thường được làm từ vải bông hoặc len tự nhiên, được thợ thủ công địa phương tạo ra từ các sợi vải được nhuộm màu bằng các chất liệu tự nhiên như lá cây, rễ cây, hoa và thảo dược."),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Ví thổ cẩm",
          120000,
          "Thổ cẩm Mường Hoa",
          "Vải thổ cẩm dệt máy. Không chỉ dùng để đừng đồ dùng nhỏ như tiền, thẻ,... mà ví thổ cẩm còn trang trí nội thất mang lại sự tự nhiên và thân thiện với môi trường sống xanh"),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Móc khóa",
          15000,
          "Thổ cẩm Mường Hoa",
          "Móc khóa được làm hoàn toàn bằng thủ công vô cùng tỉ mỉ. "
              "Với nhiều họa tiết sặc sỡ, tinh tế mang đậm màu sắc của núi rừng Tây Bắc hình dáng đặc sắc và vô cùng sinh động. "
              "Móc khoa thổ cẩm trở thành một trong những món quà độc đáo và ý nghĩa dành tặng cho người thương. Vật trang trí hết sức lạ mắt "),
    ];
  }

  static List<ProductModel> _getHoaQua() {
    return [
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Mận Sapa",
          75000,
          "Hoa quả Mường Hoa",
          "Mận là loại trái cây vừa ngọt, vừa chua, nhiều nước, "
              "quả mận giàu chất xơ, rất tốt cho sức khỏe. "
              "Từ loại hoa quả này chúng ta có thể chế biến thành nhiều món ăn đặc sắc như rượu mận, mứt mận, ô mai mận, làm siro,… "
              "Nổi tiếng nhất không thể không kể đến là rượu mận và mứt mận Sapa."),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Đào rọ",
          85000,
          "Hoa quả Mường Hoa",
          "Đào rọ chỉ nhỏ như chén nước, "
              "vị quả hơi chua nhưng thơm, giòn. "
              "Được gọi là đào rọ bởi người dân tộc ở Sapa thường đựng đào trong các rọ nhỏ đem bán. "),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Ô mai trám",
          45000,
          "Hoa quả Mường Hoa",
          "Ô mai trám cũng là một món quà được lựa chọn mua về làm quà ở Sapa. "
              "Loại quả ăn ngon và tốt cho sức khỏe. Quả trám sau khi được chế biến sẽ có màu đen và dài, vị chua ngọt xen lẫn nhau ăn rất ngon."),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Hạt dẻ Sapa",
          45000,
          "Hoa quả Mường Hoa",
          "Nếu bạn đang muốn tìm một món đặc sản Sapa thì hạt dẻ rất phù hợp nhé, rất ngon và bổ dưỡng."
              " Vào màu đông, thời tiết lạnh mà được nhâm nhi từng vốc hạt dẻ nóng hổi là đủ thấy tuyệt vời rồi. Hạt dẻ Sapa khác với hạt dẻ "
              "Trung Quốc, Cao Bằng, Quảng Uyên… nó to gấp 4 – 5 lần hạt dẻ rừng, lại có hình dạng hơi méo, "
              "ba chiều gần bằng nhau, vỏ móng, bên trong ngọt bùi, thơm ngậy thấy rõ."),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Nấm hương rừng",
          420000,
          "Hoa quả Mường Hoa",
          "Nấm hương rừng là loài đặc sản quý hiếm ở Sapa. Có thể nói đây là loại nấm đặc biệt, có vị thanh ngọt, mùi thơm nhẹ. Loại nấm này, thường mọc ở những khu rừng thuộc dãy Hoàng Liên Sơn. "
              "Tuy nhiên, do mang lại giá trị kinh tế cao nên người dân cũng đã trồng loại nấm này ở trong khu vườn của mình để tăng thêm thu nhập. Mặc dù là loại nấm tự trồng nhưng về hương vị, chất lượng, "
              "màu sắc thì không thua kém với nấm hương mọc trên núi, chất lượng dinh dưỡng chúng mang lại là như nhau. Bạn có thể tìm mua chúng ở các phiên chợ trên Sapa với giá cả phải chăng."
              " Món quà với nghĩa đầy dinh dưỡng nhất định bạn không được bỏ qua."),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Hạt Hạnh Nhân Sapa",
          150000,
          "Hoa quả Mường Hoa",
          "Cây hạnh nhân chủ yếu được trồng ở Mỹ, tuy nhiên ở vùng Tây Bắc – Việt Nam, đặc biệt là Sapa, cây hạnh nhân được mọc tự nhiên nên còn được gọi là hạt hạnh nhân rừng. "
              "Thế nhưng, giá trị dinh dưỡng mà hạt hạnh nhân rừng Sapa mang lại cũng không kém những loại hạt hạnh nhân nhập ngoại."),
    ];
  }

  static List<ProductModel> _getDoUong() {
    return [
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Rượu táo mèo",
          200000,
          "Đồ uống Mường Hoa",
          "Quả táo mèo hay có tên gọi khác là quả sơn tra từ lâu đã nổi tiếng với du khách khi đến Tây Bắc."
              " Khi nhắc đến táo mèo mọi người thường nghĩ ngay đến Trạm Tấu và Mù Cang Chải thuộc tỉnh Yên Bái,"
              " tuy nhiên nơi mà phải nghĩ tới đầu tiên chính là Sapa – Lào Cai. Để làm được rượu táo mèo cũng trải qua nhiều công đoạn khác nhau,"
              " từng quả sẽ được người dân mang đi rửa sạch, trải qua những bước ngâm. Thời điểm rượu thơm ngon là khoảng 6 – 8 tháng đạt đủ độ thơm ngon và bổ dưỡng,"
              " nhâm nhi chút rượu táo mèo và những món ăn đặc sản Sapa còn gì tuyệt vời hơn."),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Rượu San Lùng",
          150000,
          "Đồ uống Mường Hoa",
          "Rượu San Lùng là thứ rượu đặc sản của người Dao đỏ xuất phát từ thôn San Lùng, xã Bản Xèo, huyện Bát Xát."
              " Cùng với rượu Táo Mèo và rượu ngô Bắc Hà rượu San Lùng là các danh tửu của Lào Cai. "
              "Rượu San Lùng có mùi thơm lạ của men lá rừng, vị đậm đà của thóc nương."),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Rượu mận",
          180000,
          "Đồ uống Mường Hoa",
          "Loại rượu trái cây có nồng độ mạnh này cũng có thể được coi là rượu vang. "
              "Mận Tả Van rất kén chỗ trồng, nằm ở độ cao trên 1500m nên đây có lẽ là một yếu tộ tạo nên hương vị đặc sắc của mận Tả Van. "
              "Quả mận có màu đỏ phớt trắng, ruột bên trong đỏ rực, vị chua ngọt, quả chín có vị ngọt lịm và nếu ăn kỹ sẽ có vị rượu."
              " Chỉ cần ngâm mận với đường cát trắng trong vòng 6 tháng thì có thể uống được."
              " Rượu có vị hơi chát, có màu sẫm như hổ phách và hương vị như rượu vang. "),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Rượu thóc Sapa",
          230000,
          "Đồ uống Mường Hoa",
          "Chỉ cần nghe tên là bạn đã hình dung được nguyên liệu chính để làm nên loại rượu này đúng không nào,"
              " nguyên liệu chính để làm nên loại rượu này là giống thóc của người Dao Đỏ. Sau đó, trải qua giai đoạn được ủ,"
              " chưng cất theo công thức rất riêng thì bạn sẽ được một hũ rượu thóc có nồng độ tầm 38 - 40 độ.Đây là loại rượu khá thơm, không hề khó uống."
              " Khi thưởng thức, bạn có thể cảm nhận được vị thơm và ngọt nhẹ, đặc biệt, ủ càng lâu thì rượu lại càng ngon và đậm đà."),
      ProductModel(
          Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
          "Rượu sâu chít Sapa",
          280000,
          "Đồ uống Mường Hoa",
          "Rượu sâu chít hay còn được biết đến với tên gọi là rượu đông trùng hạ thảo."
              " Rươu có màu khá nhạt, như nước trái cây, đặc điểm nhận dạng là thường có màu vàng, "
              "trên bề mặt sẽ có lớp màn mỏng. Bên cạnh đó, rượu có một điểm khá hay là du bạn uống bao nhiêu thì thường sẽ không say, "
              "mà chỉ có thể hơi choáng váng một xíu thôi."),
    ];
  }

  static List<ProductModel> _getDoThuCong() {
    return [
      ProductModel(
        Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
        "Mũ thổ cẩm 3",
        45000,
        "Đặc sản mường hoa1",
        "rong khu vực. Cua sau đó được làm sạch, bỏ phần cứng và nướng trên lửa than cho đến khi chín vàng. Một số gia vị như muối, ớt, tiêu cũng có thể được thêm vào thức cùng với rau sống như rau thơm, rau răm, bún, bánh đa, và một số loại gia vị như nước mắm chua ngọt pha chế từ các nguyên liệu tự nhiên.Cáng cua không chỉ là một món ăn ngon mà còn là một phần của văn hóa ẩm thực địa phương tại Sapa. Với hương vị đặc trưng, sự tươi ngon và độc đáo, cáng cua thu hút rất nhiều du khách đến thưởng ngoạn và trải nghiệm ẩm thực của vùng núi phía Bắc Việt Nam.1",
      ),
      ProductModel(
        Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
        "Hoa quả sấy3",
        45000,
        "Đặc sản mường hoa2",
        "Để chuẩn bị cáng cua, người dân thường bắt cua đồng từ các dòng suối và ao trong khu vực. Cua sau đó được làm sạch, bỏ phần cứng và nướng trên lửa than ct, tiêu cũng có thể được thêm vào để tăng hương vị.Món cáng cua thường được thưởng thức cùng với rau sống như rau thơm, rau răm, bún, bánh đa, và một số loại gia vị như nước mắm chua ngọt pha chế từ các nguyên liệu tự nhiên.Cáng cua không chỉ là một món ăn ngon mà còn là một phần của văn hóa ẩm thực địa phương tại Sapa. Với hương vị đặc trưng, sự tươi ngon và độc đáo, cáng cua thu hút rấthiệm ẩm thực của vùng núi phía Bắc Việt Nam.2",
      ),
      ProductModel(
        Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
        "Quần áo thổ cẩm3",
        45000,
        "Đặc sản mường hoa3",
        "Để cực. Cua sau đó được. Cua sau đó được làm sạch, bỏ phần cứng và nướng trên lửa than cho đến khi chín vàng. Một số gia vị như muối, ớt, tiêu cũng  cáng cua thường được thưởng thức cùng với rau sống như rau thơm, rau răm, bún, bánh đa, và một số loại gia vị như nước mắm chua ngọt pha chế từ các nguyên liệu tự nhiên.Cáng cua không chỉ là một món ăn ngon mà còn là một phần của văn hóa ẩm thực địa phương tại Sapa. Với hương vị đặc trưng, sự tươi ngon và độc đáo, cáng cua thu hút rất nhiều du khách đến thưởng ngoạn và trải nghiệm ẩm thực của vùng núi phía Bắc Việt Nam.3",
      ),
      ProductModel(
        Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
        "Cá nướng3",
        45000,
        "Đặc sản mường hoa4",
        "Để chuẩn bị cáng cua, người dân thường bắt c sau đó được làm sạch, bỏ phần cứng và nướng trên lửa than cho đến khi chín vàng. Một số gia vị như muối,vị.Món cáng cua thường được thưởng thức cùng với rau sống như rau thơm, rau răm, bún, bánh đa, và một số loại gia vị như nước mắm chua ngọt pha chế từ các nguyên liệu tự nhiên.Cáng cua không chỉ là một món ăn ngon mà còn là một phần của văn hóa ẩm thực địa phương tại Sapa. Với hương vị đặc trưng, sự tươi ngon và độc đáo, cáng cua thu hút rất nhiều du khách đến thưởng ngoạn và trải nghiệm ẩm thực của vùng núi phía Bắc Việt Nam.4",
      ),
      ProductModel(
        Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
        "Trâu gác bếp3",
        45000,
        "Đặc sản mường hoa5",
        "Để chuẩn bị cáng cua, người dân thường bắt cua đồng từ các dòng suối và ao trong khu vực. Cua sau đó được làm sạch, bỏ phần cứng và nướng trên lửa than cho đến khi chín vàng. Một số gia vị như muối, ớt, tiêu cũng có thể được thêm vào để tăng hương vị.Món cáng cua thường được thưởng thức cùng với rau sống như rau thơm, rau răm, bún, bánh đa, và một số loại gia vị như nước mắm chua ngọt pha chế từ các nguyên liệu tự nhiên.Cáng cua không chỉ là một món ăn ngon mà còn là một phần của văn hóa ẩm thực địa phương tại Sapa. Với hương vị đặc trưng, sự tươi ngon và độc đáo, cáng cua thu hút rất nhiều du khách đến thưởng ngoạn và trải nghiệm ẩm thực của vùng núi phía Bắc Việt Nam.5",
      ),
      ProductModel(
        Image.asset(AppAssets.imgThittrau, fit: BoxFit.cover),
        "Thảo dược3",
        45000,
        "Đặc sản mường hoa6",
        "Để chuẩn bị cánc. Cua sau đó được làm sạch, bỏ phần cứng và nướng trên lửa than cho đến khi chín vàng. Một số gia vị như muối, ớt, tiêu cũng có thể được thêmưởng thức cùng với rau sống như rau thơm, rau răm, bún, bánh đa, và một số loại gia vị như nước mắm chua ngọt pha chế từ các nguyên liệu tự nhiên.Cáng cua không chỉ là một món ăn ngon mà còn là một phần của văn hóa ẩm thực địa phương tại Sapa. Với hương vị đặc trưng, sự tươi ngon và độc đáo, cáng cua thu hút rất nhiều du khách đến thưởng ngoạn và trải nghiệm ẩm thực của vùng núi phía Bắc Việt Nam.6",
      ),
    ];
  }

  factory ProductData() {
    return _instance;
  }

  ProductData._internal();
}

ProductData productData = ProductData();
