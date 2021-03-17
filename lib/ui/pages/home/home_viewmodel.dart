import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String _title = 'Home View';
  String get title => '$_title counter:$counter';

  String _bottomTitle = 'Bottom Title';
  String get bottomTitle => _bottomTitle;

  int _counter = 0;
  int get counter => _counter;

  void updateCounter() {
    _counter++;
    notifyListeners();
  }

  void init(String data){
    _title = data;
    notifyListeners();
  }
}