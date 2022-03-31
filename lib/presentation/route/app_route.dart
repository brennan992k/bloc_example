import 'package:bloc_example/presentation/screens/first_screen.dart';
import 'package:bloc_example/presentation/screens/second_screen.dart';
import 'package:bloc_example/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

abstract class AppRouterABS {
  static Route onGenerateRoute(BuildContext context, RouteSettings settings) {
    throw UnimplementedError();
  }
}

const firstScreenRoute = 'firstScreen';
const secondScreenRoute = 'secondScreen';
const thirdScreenRoute = 'thirdScreen';

class AppRouter extends AppRouterABS {
  static Route onGenerateRoute(BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case firstScreenRoute:
        return MaterialPageRoute(builder: (context) {
          return const FirstScreen(title: 'First Screen');
        });
      case secondScreenRoute:
        return MaterialPageRoute(builder: (context) {
          return const SecondScreen(title: 'Second Screen');
        });
      case thirdScreenRoute:
      return MaterialPageRoute(builder: (context) {
        return const ThirdScreen(title: 'Third Screen');
      });
      default:
        return MaterialPageRoute(builder: (context) {
          return const FirstScreen(title: 'First Screen');
        });
    }
  }
}
