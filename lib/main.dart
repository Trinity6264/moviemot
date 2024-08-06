import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:moviemot/app/app_bloc_observer.dart';
import 'package:moviemot/app/app_blocs.dart';
import 'package:moviemot/splash/page/splash_page.dart';
import 'package:moviemot/utils/constant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBlocs(
      child: MaterialApp(
        title: 'MovieMot',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Constant.primaryColor,
          ),
          primaryColor: Constant.primaryColor,
          useMaterial3: true,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
