import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:portfolio/models/download_resume.dart';

class ResumeService {
  getResume() async {
    QueryBuilder<Resume> query = QueryBuilder<Resume>(Resume());
    Resume? file = await query.first();
    return file;
  }
}
