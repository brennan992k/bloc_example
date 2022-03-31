part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {
  @override
  List<Object> get props => [];
}

class InternetLoading extends InternetState {
  InternetLoading();
}

class InternetConnected extends InternetState {
  InternetType internetType;

  InternetConnected(
    this.internetType,
  );

  @override
  List<Object> get props => [internetType];
}

class InternetDisconnected extends InternetState {
  InternetDisconnected();
}
