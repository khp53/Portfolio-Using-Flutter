import 'package:flutter/material.dart';
import 'package:portfolio/screens/viewmodel.dart';

class SkillsViewmodel extends Viewmodel {
  final List experienceData = [
    {
      'title': 'NutraForge Technologies Inc.',
      'designation': 'Full Stack Developer (Volunteer)',
      'time': 'August 2024 - Present / St. John\'s, NL / Remote',
    },
    {
      'title': 'Amharc Tech',
      'designation': 'Lead Mobile Application Developer (Part-time)',
      'time': 'May 2023 - Present / Dublin, Ireland / Remote',
    },
    {
      'title': 'Learnio ApS',
      'designation': 'IT Mentor & Video Editor',
      'time': 'Oct 2020 - Sept 2023 / Copenhagen V., Denmark / Remote',
    },
    {
      'title': 'Turtle Venture Studios',
      'designation': 'Lead Mobile Application Developer',
      'time': 'July 2022 - April 2023 / Dhaka, Bangladesh',
    },
    {
      'title': 'Robust Research & Development Ltd.',
      'designation': 'Jr. Software Engineer',
      'time': 'August 2021 - June 2022 / Dhaka, Bangladesh',
    },
    {
      'title': 'Department of OSHE, Universiti Teknologi Malaysia',
      'designation': 'Software Engineer',
      'time': 'November 2020 - September 2021 / Johor, Malaysia',
    },
    {
      'title': 'AIESEC In Malaysia, Johor Bahru',
      'designation': 'Senior Marketing Executive',
      'time': 'Feb 2020 - Feb 2021 / Johor, Malaysia',
    },
  ];

  final List contestAndHackathon = [
    {
      'title': 'Capture The Flag (CTF)',
      'organizer': 'BSides St. John\'s and AWS',
      'award': 'Fourth Place',
    },
    {
      'title': 'Amazon Robotics Hackathon',
      'organizer': 'AR Day at MUN',
      'award': '',
    },
    {
      'title': 'Do It Hackathon',
      'organizer': 'Sponsored by Spellbook',
      'award': 'Reached final round',
    },
    {
      'title': 'BMO Apex Start-up Challenge',
      'organizer': 'BMO Financial Group and University of New Brunswick',
      'award': 'Got into top 10 from 40+ teams from Canada',
    },
  ];

  final List devSkillData = [
    {
      'title': 'Dart (Flutter)',
      'value': 1,
      'color': Color(0xff18EBFC),
    },
    {
      'title': 'Swift (iOS)',
      'value': 0.7,
      'color': Color(0xff3D71D4),
    },
    {
      'title': 'Python (ML/AI)',
      'value': 0.7,
      'color': Color(0xff00EDBF),
    },
    {
      'title': 'Next JS',
      'value': 0.8,
      'color': Color.fromARGB(255, 65, 10, 229),
    },
    {
      'title': 'Node JS',
      'value': 0.8,
      'color': Color.fromARGB(255, 229, 178, 10),
    },
    {
      'title': 'CSS',
      'value': 0.8,
      'color': Color(0xff18EBFC),
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
