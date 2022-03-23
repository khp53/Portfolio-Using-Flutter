import 'package:portfolio/dependencies/dependencies.dart';
import 'package:portfolio/models/download_resume.dart';
import 'package:portfolio/screens/viewmodel.dart';
import 'package:portfolio/services/resume_service.dart';

class AboutViewmodel extends Viewmodel {
  ResumeService get _service => dependency();
  bool _isLoading = false;
  int _selectedIndex = 0;
  bool _changeColor = false;

  Resume? _resume;

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

  Resume? get resume => _resume;
  set resume(Resume? value) {
    turnBusy();
    _resume = value;
    turnIdle();
  }

  Future<Resume?> getResume() async {
    Resume? resume = await _service.getResume();
    return resume;
  }
}
