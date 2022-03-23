import 'package:portfolio/screens/viewmodel.dart';

class ContactMeViewmodel extends Viewmodel {
  bool _isLoading = false;
  int _selectedIndex = 4;
  String _email = "";
  String _name = "";
  String _subject = "";
  String _message = "";

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
}
