part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  bool firstSetting;
  bool secondSetting;
  bool thirdSetting;
  bool fourthSetting;

  SettingsState(
      {this.firstSetting = false,
      this.secondSetting = false,
      this.thirdSetting = false,
      this.fourthSetting = false});

  @override
  List<Object> get props =>
      [firstSetting, secondSetting, thirdSetting, fourthSetting];
}

class SettingsInitial extends SettingsState {
  bool firstSetting;
  bool secondSetting;
  bool thirdSetting;
  bool fourthSetting;

  SettingsInitial(
      {this.firstSetting = false,
      this.secondSetting = false,
      this.thirdSetting = false,
      this.fourthSetting = false});

  @override
  List<Object> get props =>
      [firstSetting, secondSetting, thirdSetting, fourthSetting];
}
