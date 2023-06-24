import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:portfolio/models/contact.dart';

class ContactService {
  late Contact _contact;
  addMessage(String name, String email, String subject, String message) async {
    _contact = Contact();

    _contact.set('name', name);
    _contact.set('email', email);
    _contact.set('subject', subject);
    _contact.set('message', message);

    ParseResponse response = await _contact.save();

    return response;
  }
}
