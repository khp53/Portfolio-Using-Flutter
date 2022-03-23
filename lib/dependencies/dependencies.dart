import 'package:get_it/get_it.dart';
import 'package:portfolio/services/contact_service.dart';
import 'package:portfolio/services/resume_service.dart';

GetIt dependency = GetIt.instance;

void init() {
  // dependency injection
  dependency.registerLazySingleton<ResumeService>(() => ResumeService());
  dependency.registerLazySingleton<ContactService>(() => ContactService());
}
