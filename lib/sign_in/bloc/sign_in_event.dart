

abstract class SignInEvent {}

class SignInTextChangedEvent extends SignInEvent {

  late final String emailValue;
  late final String passwordValue;

  SignInTextChangedEvent(this.emailValue, this.passwordValue);
}

class SignInSubmittedEvent extends SignInEvent {
  late final String email;
  late final String password;

  SignInSubmittedEvent(this.email, this.password);
}