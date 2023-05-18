import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:telefonchu/features/login/data/data_sources/remote/local_data_service.dart';
import 'package:telefonchu/firebase_options.dart';
import 'package:telefonchu/injection_container.dart';

class App {
  static final App _singleton = App._internal();
  factory App() => _singleton;
  App._internal();
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initDI();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return;
  }

  static bool get isSignedIn {
    try {
      di<UserLocalDataSource>().getUser();
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool get isAdmin {
    try {
      final user = di<UserLocalDataSource>().getUser();
      return user.isAdmin ?? false;
    } catch (e) {
      return false;
    }
  }
}
