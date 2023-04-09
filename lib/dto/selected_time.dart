class EnumData {
  final int time;
  final String description;
  EnumData({required this.time, required this.description});
}

enum SelectedTime {
  ONE, FIVE, TEN, THIRTY
}

extension SelectedTimeExtension on SelectedTime {
  static final _data = {
    SelectedTime.ONE: EnumData(time: 60, description: '1분마다'),
    SelectedTime.FIVE: EnumData(time: 300, description: '5분마다'),
    SelectedTime.TEN: EnumData(time: 600, description: '10분마다'),
    SelectedTime.THIRTY: EnumData(time: 1800, description: '30분마다'),
  };

  static getByDescription(String description) {
    try {
      return _data.entries.firstWhere((el) => el.value.description == description).key;
    } catch (e) {
      return null;
    }
  }


  int get time => _data[this]!.time;
  String get description => _data[this]!.description;
}
