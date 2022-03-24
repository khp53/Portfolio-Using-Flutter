import 'package:portfolio/dependencies/dependencies.dart';
import 'package:portfolio/models/about.dart';
import 'package:portfolio/screens/viewmodel.dart';
import 'package:portfolio/services/about_service.dart';
import 'package:portfolio/services/contact_service.dart';

class ContactMeViewmodel extends Viewmodel {
  ContactService get _service => dependency();
  AboutService get _aboutService => AboutService();

  bool _isLoading = false;
  int _selectedIndex = 4;
  String _email = "";
  String _name = "";
  String _subject = "";
  String _message = "";

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

  get email => _email;
  set email(value) {
    turnBusy();
    _email = value;
    turnIdle();
  }

  get name => _name;
  set name(value) {
    turnBusy();
    _name = value;
    turnIdle();
  }

  get subject => _subject;
  set subject(value) {
    turnBusy();
    _subject = value;
    turnIdle();
  }

  get message => _message;
  set message(value) {
    turnBusy();
    _message = value;
    turnIdle();
  }

  About? get about => _about;
  set about(About? value) {
    turnBusy();
    _about = value;
    turnIdle();
  }

  sendMessage() {
    var res = _service.addMessage(name, email, subject, message);
    return res;
  }

  Future<About?> getAboutStuff() async {
    return await _aboutService.getAboutStuff();
  }
}
