
import 'package:flutter_bloc/flutter_bloc.dart';
import "./password_visiblity_event.dart";
import "./password_visiblity_state.dart";

class PasswordVisiblityBloc extends Bloc<PasswordVisiblityEvent, PasswordVisiblityState> {
  PasswordVisiblityBloc() : super(PasswordVisiblityState(isPasswordVisible: false)) {
    on<TogglePasswordVisiblity>((event, emit) {
      emit(PasswordVisiblityState(isPasswordVisible: !state.isPasswordVisible));
    });
  }
}





// How This Works?
// The BLoC starts with isPasswordVisible: false (password is hidden).

// When the TogglePasswordVisibility event is triggered, it flips the current state.

// The UI will rebuild automatically when the state changes.

// The password visibility will be toggled when the user taps on the "eye" icon.
// This file connects the event and the state.

// When the user presses the "eye" button, the event is sent to this file.

// The BLoC updates the state, toggling isPasswordVisible.

// The UI rebuilds based on the new state.