import 'package:bloc_example/logic/cubits/counter_cubit/counter_cubit.dart';
import 'package:bloc_example/presentation/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // BlocListener<CounterCubit, CounterState>(
            //   listener: (context, state) {
            //     if (state.isIncrement == true) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //           SnackBar(content: Text('INCREMENT ${state.counter}')));
            //     } else if (state.isIncrement == false) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //           SnackBar(content: Text('DECREMENT ${state.counter}')));
            //     }
            //   },
            //   child: Text(
            //     'VALUE',
            //     style: Theme.of(context).textTheme.headline4,
            //   ),
            // ),
            // BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
            //   return Text(
            //     '${state.counter}',
            //     style: Theme.of(context).textTheme.headline4,
            //   );
            // }),
            BlocConsumer<CounterCubit, CounterState>(builder: (context, state) {
              return Text(
                '${state.counter}',
                style: Theme.of(context).textTheme.headline4,
              );
            }, listener: (context, state) {
              if (state.isIncrement == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('INCREMENT ${state.counter}'),
                    duration: const Duration(microseconds: 10),
                  ),
                );
              } else if (state.isIncrement == false) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('DECREMENT ${state.counter}'),
                  duration: const Duration(microseconds: 10),
                ));
              }
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: BlocProvider.of<CounterCubit>(context).decrement,
                    child: const Icon(Icons.subway_outlined)),
                TextButton(
                    onPressed: BlocProvider.of<CounterCubit>(context).increment,
                    child: const Icon(Icons.add_outlined))
              ],
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, secondScreenRoute),
              child: const Text('Go to second screen'),
            )
          ],
        ),
      ),
    );
  }
}
