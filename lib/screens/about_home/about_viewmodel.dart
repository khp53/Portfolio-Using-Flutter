import 'package:portfolio/screens/viewmodel.dart';

class AboutViewmodel extends Viewmodel {
  bool _isLoading = false;
  int _selectedIndex = 0;
  bool _changeColor = false;

  get selectedIndex => _selectedIndex;
  set selectedIndex(value) {
    turnBusy();
    _selectedIndex = value;
    turnIdle();
  }

  get isLoading => _isLoading;
  set isLoading(value) {
    turnBusy();
    _isLoading = value;
    turnIdle();
  }

  get changeColor => _changeColor;
  set changeColor(value) {
    turnBusy();
    _changeColor = value;
    turnIdle();
  }
}
