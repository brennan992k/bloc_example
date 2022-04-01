part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  bool value;
  SettingsEvent({required this.value});

  @override
  List<Object> get props => [];
}

class FirstSettingsEvent extends SettingsEvent {
  FirstSettingsEvent({required bool value}) : super(value: value);
}

class SecondSettingsEvent extends SettingsEvent {
  SecondSettingsEvent({required bool value}) : super(value: value);
}

class ThirdSettingsEvent extends SettingsEvent {
  ThirdSettingsEvent({required bool value}) : super(value: value);
}

class FourthSettingsEvent extends SettingsEvent {
  FourthSettingsEvent({required bool value}) : super(value: value);
}
