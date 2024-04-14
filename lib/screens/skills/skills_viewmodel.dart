import 'package:flutter/material.dart';
import 'package:portfolio/screens/viewmodel.dart';

class SkillsViewmodel extends Viewmodel {
  final List experienceData = [
    {
      'title': 'Amharc Tech',
      'designation': 'Lead Mobile Application Developer',
      'time': 'May 2023 - Present / Dublin, Ireland / Remote',
      'description':
          '- Designing and editing videos for Learnio ApS\n- Creating Software Engineering and App Development Course\n- Created After Effects and Premiere Pro Course',
    },
    {
      'title': 'Learnio ApS',
      'designation': 'App Dev. Mentor & Formar Video Editor',
      'time': 'Oct 2020 - Present / Copenhagen V., Denmark / Remote',
      'description':
          '- Designing and editing videos for Learnio ApS\n- Creating Software Engineering and App Development Course\n- Created After Effects and Premiere Pro Course',
    },
    {
      'title': 'Turtle Venture Studios',
      'designation': 'Lead Mobile Application Developer',
      'time': 'July 2022 - April 2023 / Dhaka, Bangladesh',
      'description':
          '- Designing and editing videos for Learnio ApS\n- Creating Software Engineering and App Development Course\n- Created After Effects and Premiere Pro Course',
    },
    {
      'title': 'Robust Research & Development Ltd.',
      'designation': 'Jr. Mobile Application Developer',
      'time': 'August 2021 - June 2022 / Dhaka, Bangladesh',
      'description':
          '- Worked on a cross-platform project called Sure Care.\n' +
              '- Worked on an ERP solution from the ground up.\n' +
              '- Amar Bangabandhu app deployed it to App Store.\n' +
              '- Worked on the architecture of a password manager app.'
    },
    {
      'title': 'Department of OSHE, Universiti Teknologi Malaysia',
      'designation': 'Software Engineer',
      'time': 'November 2020 - September 2021 / Johor, Malaysia',
      'description': '- Developed UTM COVID-19 Contact Tracing Application\n' +
          '  (UTM CCTA), a contact tracing application as part of my\n' +
          '  final year project.\n' +
          '- Architected and Completed system documentation\n' +
          '  including SRS, SDD, STD, UI design.\n' +
          '- Technologies Used: Flutter, Firestore, FCM, Cloud Functions,\n' +
          '  BLE, Nearby API, Layered Architecture, RUP Methodology.',
    },
    {
      'title': 'AIESEC In Malaysia, Johor Bahru',
      'designation': 'Senior Marketing Executive (Volunteer)',
      'time': 'Feb 2020 - Feb 2021 / Johor, Malaysia',
      'description': '- Motion design.\n' +
          '- Poster design.\n' +
          '- Cinemagraph.\n' +
          '- Content creation.\n' +
          '- Event management.',
    },
  ];

  final List devSkillData = [
    {
      'title': 'Flutter',
      'value': 1,
      'color': Color(0xff18EBFC),
    },
    {
      'title': 'OOP',
      'value': 0.9,
      'color': Color(0xff00EDBF),
    },
    {
      'title': 'Parse Server',
      'value': 0.9,
      'color': Color(0xff3D71D4),
    },
    {
      'title': 'Firebase',
      'value': 0.9,
      'color': Color(0xffE5DC0A),
    },
    {
      'title': 'JSON',
      'value': 0.9,
      'color': Color(0xff3D71D4),
    },
    {
      'title': 'REST Api',
      'value': 1,
      'color': Color(0xffE5DC0A),
    },
    {
      'title': 'CSS',
      'value': 1,
      'color': Color(0xff18EBFC),
    },
    {
      'title': 'JavaScript',
      'value': 0.8,
      'color': Color.fromARGB(255, 229, 178, 10),
    },
    {
      'title': 'MySQL',
      'value': 0.6,
      'color': Color(0xffE50AAA),
    },
  ];

  final List motionSkillData = [
    {
      'title': 'DaVinci Resolve',
      'value': 0.7,
      'color': Color.fromARGB(255, 229, 160, 10),
    },
    {
      'title': 'Adobe Premiere Pro',
      'value': 0.9,
      'color': Color(0xffE5DC0A),
    },
    {
      'title': 'Adobe After Effects',
      'value': 0.8,
      'color': Color(0xff18EBFC),
    },
    {
      'title': 'Adobe Illustrator',
      'value': 0.9,
      'color': Color(0xffE50AAA),
    },
    {
      'title': 'Adobe XD',
      'value': 0.9,
      'color': Color(0xff18EBFC),
    },
    {
      'title': 'Figma',
      'value': 0.8,
      'color': Color.fromARGB(255, 142, 24, 252),
    },
    {
      'title': 'Adobe Photoshop',
      'value': 0.7,
      'color': Color(0xff3D71D4),
    },
  ];

  bool _isLoading = false;
  int _selectedIndex = 3;

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
}
