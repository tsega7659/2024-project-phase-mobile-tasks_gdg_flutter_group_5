import 'package:flutter_bloc/flutter_bloc.dart';
import './email_event.dart';
import './email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  EmailBloc() : super(EmailState(email: "")) {
    on<DisplayEmailEvent>((event, emit) {
      emit(EmailState(email: event.email)); // Use the email from the event
    });
  }
}
