import '../model/destination.dart';

class DestinationProvider {
  Future<List<Destination>> getListDestination() async {
    final listDestination = [
      const Destination(
          name: 'Lang Biang',
          imageUrl: 'https://imgur.com/YRggsQ1.png',
          location: 'Đà Lạt',
          latitude: 12.046737321104,
          longtitude: 108.44021157095693,
          pointReview: '4.6',
          favouriteNumber: 200,
          detail:
              'Núi Langbiang là một cụm núi cao nằm cách thành phố Đà Lạt 12 km thuộc địa phận huyện Lạc Dương. Hai núi cao nhất tại đây là núi Bà cao 2.167 m và núi Ông cao 2.124 m so với mặt nước biển. Ngoài ra trong khu du lịch còn có ngọn đồi Ra-đa cao 1.929 m, ngọn đồi này cũng là một địa điểm quen thuộc đối với du khách. Nhìn từ trung tâm thành phố Đà Lạt có thể thấy núi Bà nằm bên trái, núi Ông nằm bên phải. Langbiang được ví như "nóc nhà" của Đà Lạt và là điểm tham quan du lịch hấp dẫn, nổi tiếng ở thành phố này.'),
      const Destination(
          name: 'Đồi Con Heo',
          imageUrl: 'https://imgur.com/9sNSlfh.png',
          location: 'Vũng Tàu',
          latitude: 10.326430942508805,
          longtitude: 107.08452118928813,
          pointReview: '5',
          favouriteNumber: 1100,
          detail:
              'Đồi Con Heo với nét hoang sơ hòa quyện cùng chút bí ẩn của con đường đầy sỏi đá, chút hoang dại mà lãng mạn của đồi cỏ khô và sự bao la, bát ngát của biển trời,… tất cả tạo nên sự hấp dẫn đặc biệt thu hút đông đảo khách du lịch cũng như dân bản địa lui tới.\nĐồi con heo cũng nằm ngay bãi biển Thuỳ Vân và một số điểm tham quan khác, vì vậy bạn có thể thuê những khách sạn gần đây để tiện cho việc vui chơi và khám phá Vũng Tàu nhất nhé.'),
      const Destination(
          name: 'Mũi Nghinh Phong',
          imageUrl: 'https://imgur.com/qb8qx0x.png',
          location: 'Vũng Tàu',
          latitude: 10.322188530106466,
          longtitude: 107.08355880164085,
          pointReview: '4.5',
          favouriteNumber: 300,
          detail:
              'Mũi Nghinh Phong là mũi đất vươn dài nhất ở phía Nam của bán đảo Vũng Tàu, đây là nơi đón gió suốt bốn mùa, chả vậy mà mũi có tên là Nghinh Phong. Mũi tạo ra hai bãi tắm là bãi Vọng Nguyệt và bãi Hương Phong, hai vịnh lớn ở hướng Tây và hướng Đông.\nDu khách tìm đến mũi Nghinh Phong như một chốn để nghỉ ngơi, thư giãn sau những ngày làm việc vất vả. Nước biển ở đây trong và sạch, không khí trong lành dễ chịu.'),
      const Destination(
          name: 'Vinpearl Land Nha Trang',
          imageUrl: 'https://imgur.com/8y54Er1.png',
          location: 'Nha Trang',
          latitude: 12.214012257721151,
          longtitude: 109.24114111752178,
          pointReview: '4.9',
          favouriteNumber: 700,
          detail:
              'Du lịch Nha Trang thì tất nhiên không thể không kể đến VinWonders (Vinpearl Land) – Công viên vui chơi giải trí bậc nhất thành phố biển.\nNằm trên đảo Hòn Tre, cụ thể là ở địa chỉ 98B/13 Trần Phú, Lộc Thọ, Vinwonders Nha Trang là địa điểm nổi tiếng ở Nha Trang bao gồm nhiều khu vực vui chơi dành cho mọi lứa tuổi như công viên nước khu vui chơi ngoài trời, khu vui chơi trong nhà, thủy cung, khu ẩm thực, khu mua sắm,… thỏa sức khám phá của tất cả du khách.\nVinwonders Nha Trang được sánh ngang tầm với các công viên giải trí trong khu vực và thế giới. Một điều thú vị khi đến Vinwonders là bạn có thể trải nghiệm khu nghỉ dưỡng Vinpearl Nha Trang đẳng cấp 5 sao theo tiêu chuẩn quốc tế.')
    ];
    return listDestination;
  }
}
