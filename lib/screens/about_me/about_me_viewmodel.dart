import 'package:portfolio/screens/viewmodel.dart';

class AboutMeViewmodel extends Viewmodel {
  bool _isLoading = false;
  int _selectedIndex = 1;

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
}
