import 'package:bloc_example/logic/cubits/counter_cubit/counter_cubit.dart';
import 'package:bloc_example/logic/cubits/internet_cubit/internet_cubit.dart';
import 'package:bloc_example/presentation/route/app_route.dart';
import 'package:bloc_example/presentation/screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
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
