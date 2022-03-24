import 'package:portfolio/models/about.dart';
import 'package:portfolio/screens/viewmodel.dart';
import 'package:portfolio/services/about_service.dart';

class AboutMeViewmodel extends Viewmodel {
  AboutService get _aboutService => AboutService();

  bool _isLoading = false;
  int _selectedIndex = 1;

  About? _about;

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

  About? get about => _about;
  set about(About? value) {
    turnBusy();
    _about = value;
    turnIdle();
  }

  Future<About?> getAboutStuff() async {
    return await _aboutService.getAboutStuff();
  }
}
