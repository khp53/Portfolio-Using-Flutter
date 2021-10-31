import 'package:portfolio/screens/viewmodel.dart';

class PortfolioViewmodel extends Viewmodel {
  bool _isLoading = false;
  int _selectedIndex = 2;
  int _index = 0;
  int _motionIndex = 0;
  bool _hovering = false;
  bool _motionHovering = false;

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

  get motionIndex => _motionIndex;
  set motionIndex(value) {
    turnBusy();
    _motionIndex = value;
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

  get motionHovering => _motionHovering;
  set motionHovering(value) {
    turnBusy();
    _motionHovering = value;
    turnIdle();
  }
}
