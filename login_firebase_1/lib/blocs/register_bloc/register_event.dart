import 'package:equatable/equatable.dart';
import 'package:login_firebase_1/models/user_register_models/user_register_model.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterEmailChanged extends RegisterEvent {
  final String email;

  RegisterEmailChanged({this.email});

  @override
  List<Object> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  final String password;

  RegisterPasswordChanged({this.password});

  @override
  List<Object> get props => [password];
}

class RegisterSubmitted extends RegisterEvent {
  final UserRegisterModel userRegisterModel;
  RegisterSubmitted({this.userRegisterModel});

  @override
  List<Object> get props => [userRegisterModel];
}
