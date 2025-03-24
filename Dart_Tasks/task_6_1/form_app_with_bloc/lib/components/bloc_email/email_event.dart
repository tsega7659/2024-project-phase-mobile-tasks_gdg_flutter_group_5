abstract class EmailEvent {}

class DisplayEmailEvent extends EmailEvent {
  final String email;
  DisplayEmailEvent(this.email);
}
