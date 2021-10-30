import 'package:portfolio/screens/viewmodel.dart';

class PortfolioViewmodel extends Viewmodel {
  bool _isLoading = false;
  int _selectedIndex = 2;
  int _index = 0;
  bool _hovering = false;

  get selectedIndex => _selectedIndex;
  set selectedIndex(value) {
    turnBusy();
    _selectedIndex = value;
    turnIdle();
  }

  get index => _index;
  set index(value) {
    turnBusy();
    _index = value;
    turnIdle();
  }

  get isLoading => _isLoading;
  set isLoading(value) {
    turnBusy();
    _isLoading = value;
    turnIdle();
  }

  get hovering => _hovering;
  set hovering(value) {
    turnBusy();
    _hovering = value;
    turnIdle();
  }
}
