import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasck_app/core/app/my_app.dart';
import 'package:flutter_tasck_app/shared/data/services/shared_pref_services.dart';
import 'package:flutter_tasck_app/simple_bloc_observer.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();

  // // تهيئة Hive
  await Hive.initFlutter();

  await Prefs.init();

  runApp(const MyApp());
}
