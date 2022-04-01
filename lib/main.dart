import 'package:bloc_example/logic/blocs/settings_bloc/settings_bloc.dart';
import 'package:bloc_example/logic/cubits/counter_cubit/counter_cubit.dart';
import 'package:bloc_example/logic/cubits/internet_cubit/internet_cubit.dart';
import 'package:bloc_example/presentation/route/app_route.dart';
import 'package:bloc_example/presentation/screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Custom [BlocObserver] that observes all bloc and cubit state changes.
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocOverrides.runZoned(() => runApp(MyApp()), blocObserver: AppBlocObserver())
  ;
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => InternetCubit(),
          ),
          BlocProvider(
              create: (context) => CounterCubit(
                  internetCubit: BlocProvider.of<InternetCubit>(context))),
          BlocProvider(create: (context) => SettingsBloc())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const FirstScreen(title: 'Screen 1'),
          initialRoute: firstScreenRoute,
          onGenerateRoute: (settings) =>
              AppRouter.onGenerateRoute(context, settings),
        ));
  }
}
