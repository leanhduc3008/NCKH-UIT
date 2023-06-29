import '../model/destination.dart';

class DestinationProvider {
  Future<List<Destination>> getListDestination() async {
    final listDestination = [
      const Destination(
          name: 'Suối Tiên',
          imageUrl: 'https://imgur.com/AJ84CxW.png',
          location: 'Thủ Đức, HCM',
          latitude: 10.870999457312625,
          longtitude: 106.80223043573271,
          pointReview: '4.9',
          favouriteNumber: 999,
          detail:
              'Khu Du lịch Văn hóa Suối Tiên là một công viên liên hợp vui chơi giải trí kết hợp truyền thống các yếu tố văn hóa - lịch sử - tâm linh. Tọa lạc tại 120 Xa lộ Hà Nội, Phường Tân Phú, Thành phố Thủ Đức, Thành phố Hồ Chí Minh. Kiểu cách kiến trúc và các thể loại vui chơi được gắn lồng vào các hình ảnh lịch sử và truyền thuyết Việt Nam như Lạc Long Quân - Âu Cơ, Vua Hùng, Sơn Tinh Thủy Tinh, mười chín tầng địa ngục, tứ linh hội tụ Long - Lân - Quy - Phụng, công viên giải trí dưới nước, đặc biệt là biển Tiên Đồng - biển nhân tạo đầu tiên ở Việt Nam.'),
      const Destination(
          name: 'Bưu Điện Thành Phố',
          imageUrl: 'https://imgur.com/p714EoJ.png',
          location: 'Quận 1, HCM',
          latitude: 10.780276146929756,
          longtitude: 106.70017869610362,
          pointReview: '4.8',
          favouriteNumber: 453,
          detail:
              'Bưu điện Sài Gòn là một trong những công trình kiến trúc tiêu biểu tại Thành phố Hồ Chí Minh, tọa lạc tại số 2, Công trường Công xã Paris, Quận 1. Đây là tòa nhà được người Pháp xây dựng trong khoảng năm 1886–1891 với phong cách chiết trung theo đồ án thiết kế của kiến trúc sư Marie-Alfred Foulhoux. Đây là công trình kiến trúc mang phong cách phương Tây kết hợp với nét trang trí phương Đông.'),
      const Destination(
          name: 'Bảo tàng Lịch sử Việt Nam',
          imageUrl: 'https://imgur.com/GH5kMzP.png',
          location: 'Quận 1, HCM',
          latitude: 10.788637430933413,
          longtitude: 106.70486634603687,
          pointReview: '4.3',
          favouriteNumber: 367,
          detail:
              'Bảo tàng Lịch sử Thành phố Hồ Chí Minh tọa lạc tại số 2 đường Nguyễn Bỉnh Khiêm, phường Bến Nghé, Quận 1, trong khuôn viên Thảo Cầm Viên Sài Gòn. Đây là nơi bảo tồn và trưng bày hàng chục ngàn hiện vật quý được sưu tầm trong và ngoài nước Việt Nam.'),
      const Destination(
          name: 'Chợ Bến Thành',
          imageUrl: 'https://imgur.com/krG4KgE.png',
          location: 'Quận 1, HCM',
          latitude: 10.7725168,
          longtitude: 106.6980208,
          pointReview: '4.5',
          favouriteNumber: 376,
          detail:
              'Chợ Bến Thành là một ngôi chợ nằm tại quận 1, Thành phố Hồ Chí Minh. Chợ được khởi công xây dựng từ năm 1912, hình ảnh đồng hồ ở cửa nam của ngôi chợ này được xem là biểu tượng không chính thức của Thành phố Hồ Chí Minh.'),
      const Destination(
          name: 'Dinh Độc Lập',
          imageUrl: 'https://imgur.com/1oeaOgG.png',
          location: 'Quận 1, HCM',
          latitude: 10.7769942,
          longtitude: 106.6953021,
          pointReview: '4.9',
          favouriteNumber: 699,
          detail:
              'Dinh Độc Lập là một tòa dinh thự tại Thành phố Hồ Chí Minh, từng là nơi ở và làm việc của Tổng thống Việt Nam Cộng hòa trước Sự kiện 30 tháng 4 năm 1975. Hiện nay, dinh đã được Chính phủ Việt Nam xếp hạng là di tích quốc gia đặc biệt.'),
    ];
    return listDestination;
  }
}
