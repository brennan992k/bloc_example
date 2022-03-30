part of 'counter_cubit.dart';

@immutable
abstract class CounterState extends Equatable {
  int counter;
  bool? isIncrement;
  CounterState({required this.counter, this.isIncrement});
}

class CounterInitial extends CounterState {
  CounterInitial({required int counter, bool? isIncrement})
      : super(counter: counter, isIncrement: isIncrement);

  @override
  List<Object?> get props => [counter, isIncrement];
}
