import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'temp_settings_state.dart';

class TempSettingsCubit extends Cubit<TempSettingsState> {
  TempSettingsCubit() : super(TempSettingsState.initial());

  void toggleTempUnit() {
    emit(state.copyWith(
      tempUnit: state.tempUnit == TempUnit.celsius
          ? TempUnit.fahrenheit
          : TempUnit.fahrenheit,
    ));
    log('tempUnit: $state');
  }
}
