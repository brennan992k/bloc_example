import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/logic/cubits/internet_cubit/internet_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  InternetCubit internetCubit;
  late final StreamSubscription internetSub;

  CounterCubit({required this.internetCubit})
      : super(CounterInitial(counter: 0)) {
    internetSub = internetCubit.stream.listen((event) {
      if (event is InternetDisconnected) {
        decrement();
      } else if (event is InternetConnected) {
        increment();
      }
    });
  }

  void increment() =>
      emit(CounterInitial(counter: state.counter + 1, isIncrement: true));
  void decrement() =>
      emit(CounterInitial(counter: state.counter - 1, isIncrement: false));

  @override
  Future<void> close() {
    internetCubit.close();
    return super.close();
  }
}
