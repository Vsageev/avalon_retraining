import 'package:avanpost_retraining/pages/ai_test/ai_test_cubit.dart';
import 'package:avanpost_retraining/pages/ai_test/ai_test_page.dart';
import 'package:avanpost_retraining/pages/classes/classes_cubit.dart';
import 'package:avanpost_retraining/pages/classes/classes_page.dart';
import 'package:avanpost_retraining/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigatedPage extends StatelessWidget {
  const NavigatedPage({super.key, required this.body, required this.currentPageType, this.actions});

  final Widget body;
  final PageType currentPageType;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Scaffold(
          backgroundColor: CustomColors.background,
          body: Column(
            children: [
              Container(
                height: 55,
              ),
              Expanded(
                child: body,
              ),
            ],
          ),
        ),
        Container(
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: const BoxDecoration(
            color: CustomColors.backgroundAccent,
            border: Border(
              bottom: BorderSide(color: CustomColors.div, width: 1),
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 35,
                width: 35,
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/avalon-b1d6a.appspot.com/o/logo.png?alt=media&token=78b3eb04-4280-4416-b4e6-ede5ad8a16d2',
                  isAntiAlias: true,
                ),
              ),
              Container(width: 16),
              const Text(
                '',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(width: 16),
              RouteButton(pageType: PageType.classes, selected: currentPageType == PageType.classes),
              Container(width: 16),
              RouteButton(pageType: PageType.aiTest, selected: currentPageType == PageType.aiTest),
              const Expanded(child: SizedBox.shrink()),
              ...actions ?? []
            ],
          ),
        )
      ],
    ));
  }
}

class RouteButton extends StatelessWidget {
  const RouteButton({super.key, required this.pageType, required this.selected});

  final PageType pageType;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            pageType.route(),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(5),
          child: Text(
            pageType.text(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: selected ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

enum PageType {
  classes,
  aiTest;

  String text() {
    switch (this) {
      case classes:
        return 'Классы';
      case aiTest:
        return 'Тестировать';
      default:
        return 'err';
    }
  }

  MaterialPageRoute route() {
    switch (this) {
      case classes:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ClassesCubit(),
            child: const ClassesPage(),
          ),
        );
      case aiTest:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AiTestCubit(),
            child: const AiTestPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ClassesCubit(),
            child: const ClassesPage(),
          ),
        );
    }
  }
}
