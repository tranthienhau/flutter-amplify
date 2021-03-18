import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:stacked/stacked.dart';

import 'package:amplify_core/amplify_core.dart';

import 'package:fl_template/amplifyconfiguration.dart';

class HomeViewModel extends BaseViewModel {
  String _title = 'Home View';
  String get title => '$_title counter:$counter';

  bool _amplifyConfigured = false;

  // Instantiate Amplify

  String _bottomTitle = 'Bottom Title';
  String get bottomTitle => _bottomTitle;

  int _counter = 0;
  int get counter => _counter;

  void _configureAmplify() async {

    Amplify.addPlugin(AmplifyAuthCognito());

    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print("Amplify was already configured. Was the app restarted?");
    }

    try {
      _amplifyConfigured = true;
    } catch (e) {
      print(e);
    }
  }

  void updateCounter() {
    _counter++;
    notifyListeners();
  }

  void init(String data){
    _title = data;

    _configureAmplify();

    notifyListeners();
  }
}