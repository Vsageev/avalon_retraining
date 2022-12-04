import 'package:avanpost_retraining/pages/classes/classes_cubit.dart';
import 'package:avanpost_retraining/pages/classes/classes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            for (final platform in TargetPlatform.values) platform: const NoTransitionsBuilder(),
          },
        ),
        fontFamily: 'Montserrat',
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ClassesCubit(),
        child: const ClassesPage(),
      ),
    ),
  );
}

class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget? child,
  ) {
    return child!;
  }
}
