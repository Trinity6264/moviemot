import "dart:developer";

import "package:bloc/bloc.dart";

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onCreate(BlocBase<void> bloc) {
    super.onCreate(bloc);
    log("${bloc.runtimeType} created");
  }

  @override
  void onClose(BlocBase<void> bloc) {
    super.onClose(bloc);
    log("${bloc.runtimeType} disposed");
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log("onError(${bloc.runtimeType}, $error, $stackTrace)");
    super.onError(bloc, error, stackTrace);
  }
}
