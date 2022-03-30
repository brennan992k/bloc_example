import 'package:bloc_example/logic/cubits/counter_cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test('the initial state for the CounterCubit is CounterIntial(counter: 0)',
        () {
      expect(counterCubit.state, CounterInitial(counter: 0));
    });

    blocTest('The state should be CounterIntial(counter: 1, isIncrement: true)',
        build: () => counterCubit,
        act: (bloc) {
          bloc as CounterCubit;
          bloc.increment();
        },
        expect: () => [CounterInitial(counter: 1, isIncrement: true)]);
  });
}
