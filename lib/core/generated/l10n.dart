// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Learn Language C++`
  String get title {
    return Intl.message(
      'Learn Language C++',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Training With Solutions`
  String get Solutions {
    return Intl.message(
      'Training With Solutions',
      name: 'Solutions',
      desc: '',
      args: [],
    );
  }

  /// `Code translator`
  String get Codetranslator {
    return Intl.message(
      'Code translator',
      name: 'Codetranslator',
      desc: '',
      args: [],
    );
  }

  /// `Basecs`
  String get basecs {
    return Intl.message('Basecs', name: 'basecs', desc: '', args: []);
  }

  /// `Object Programming`
  String get opp {
    return Intl.message('Object Programming', name: 'opp', desc: '', args: []);
  }

  /// `Introduction`
  String get Introduction {
    return Intl.message(
      'Introduction',
      name: 'Introduction',
      desc: '',
      args: [],
    );
  }

  /// `Why Start in C++`
  String get WhyStartinC {
    return Intl.message(
      'Why Start in C++',
      name: 'WhyStartinC',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get Comments {
    return Intl.message('Comments', name: 'Comments', desc: '', args: []);
  }

  /// `OutPut`
  String get OutPut {
    return Intl.message('OutPut', name: 'OutPut', desc: '', args: []);
  }

  /// `Variables`
  String get Variables {
    return Intl.message('Variables', name: 'Variables', desc: '', args: []);
  }

  /// `Inputs`
  String get Inputs {
    return Intl.message('Inputs', name: 'Inputs', desc: '', args: []);
  }

  /// `Arithmeitc Operations`
  String get ArithmeitcOperations {
    return Intl.message(
      'Arithmeitc Operations',
      name: 'ArithmeitcOperations',
      desc: '',
      args: [],
    );
  }

  /// `Logic operations`
  String get Logicoperations {
    return Intl.message(
      'Logic operations',
      name: 'Logicoperations',
      desc: '',
      args: [],
    );
  }

  /// `Condition statement`
  String get Conditionstatement {
    return Intl.message(
      'Condition statement',
      name: 'Conditionstatement',
      desc: '',
      args: [],
    );
  }

  /// `Loops`
  String get Loops {
    return Intl.message('Loops', name: 'Loops', desc: '', args: []);
  }

  /// `Arrays`
  String get Arrays {
    return Intl.message('Arrays', name: 'Arrays', desc: '', args: []);
  }

  /// `Functions`
  String get Functions {
    return Intl.message('Functions', name: 'Functions', desc: '', args: []);
  }

  /// `Introduction`
  String get IntroductionOpp {
    return Intl.message(
      'Introduction',
      name: 'IntroductionOpp',
      desc: '',
      args: [],
    );
  }

  /// `Classes and Objects`
  String get ClassesandObjects {
    return Intl.message(
      'Classes and Objects',
      name: 'ClassesandObjects',
      desc: '',
      args: [],
    );
  }

  /// `Encapsulation`
  String get Encapsulation {
    return Intl.message(
      'Encapsulation',
      name: 'Encapsulation',
      desc: '',
      args: [],
    );
  }

  /// `Inheritance`
  String get Inheritance {
    return Intl.message('Inheritance', name: 'Inheritance', desc: '', args: []);
  }

  /// `Polymorphism`
  String get Polymorphism {
    return Intl.message(
      'Polymorphism',
      name: 'Polymorphism',
      desc: '',
      args: [],
    );
  }

  /// `Interfaces`
  String get Interfaces {
    return Intl.message('Interfaces', name: 'Interfaces', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
