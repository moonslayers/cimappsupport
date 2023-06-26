import 'package:flutter/material.dart';

import 'main.dart';
import 'ActivityScheduler.dart';
import 'QuizzPage.dart';
import 'ContactsPage.dart';
import 'RecursosPage.dart';

final Map<String, WidgetBuilder> routes = {
  '/feed': (context) => const FeedPage(),
  '/quizz': (context) => const QuizzPage(),
  '/favorites': (context) => const QuizzPage(),
  '/resources': (context) => const RecursosPage(),
  '/scheduler': (context) => const SchedulerActivity(),
  '/pomodoro': (context) => const QuizzPage(),
  '/contact': (context) => const ContactsPage(),
  '/sos': (context) => const SchedulerActivity(),
};
