import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {
      emit(SettingsInitial(
        firstSetting:
            event is FirstSettingsEvent ? event.value : state.firstSetting,
        secondSetting:
            event is SecondSettingsEvent ? event.value : state.secondSetting,
        thirdSetting:
            event is ThirdSettingsEvent ? event.value : state.thirdSetting,
        fourthSetting:
            event is FourthSettingsEvent ? event.value : state.fourthSetting,
      ));
    });
  }

  toggleSettings(SettingsEvent event) {
    if (event is FirstSettingsEvent && event.value != state.firstSetting ||
        (event is SecondSettingsEvent && event.value != state.secondSetting) ||
        (event is ThirdSettingsEvent && event.value != state.thirdSetting) ||
        (event is FourthSettingsEvent && event.value != state.fourthSetting)) {
      add(event);
    }
  }
}
