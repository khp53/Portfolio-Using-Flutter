import 'package:portfolio/models/about.dart';
import 'package:portfolio/screens/viewmodel.dart';
import 'package:portfolio/services/about_service.dart';

class AboutMeViewmodel extends Viewmodel {
  AboutService get _aboutService => AboutService();

  bool _isLoading = false;
  int _selectedIndex = 1;

  About? _about;

  String get aboutDescription =>
      '''🚀 Transforming ideas into impactful digital experiences! As a dedicated Full Stack Developer with nearly half a decade of industry experience, I specialize in crafting high-performance software solutions that drive business success across multiple industries. Let's connect to explore how we can turn your next project into a success story!

👨‍💻 My journey in software development includes every stage of the software development lifecycle; from conceptualization and design through coding, testing, and deployment. This comprehensive expertise allows me to deliver applications that meet and exceed client expectations.

🔍 Passionate about technology and innovation, I continuously seek out the latest trends and tools to refine my skills and boost the efficiency and aesthetics of my projects. Whether flying solo or collaborating with teams, I always focus on delivering outstanding results that align perfectly with client and stakeholder needs.

🌟 With a knack for clear communication and a commitment to project timelines, I ensure seamless interactions and project alignment from start to finish.''';

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
