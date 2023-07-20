import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver{
  @override
  void onTransition(Bloc bloc, Transition transition) {


    debugPrint('$transition');
  }
  @override
  void onChange(BlocBase bloc, Change change) {


    debugPrint('$change');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('$bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
   debugPrint('$bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

}
