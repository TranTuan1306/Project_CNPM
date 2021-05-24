import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_firebase_1/models/user_models/user_model.dart';

abstract class AuthenticationState extends Equatable {
  final UserModel firebaseUser;
  AuthenticationState(this.firebaseUser);

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  AuthenticationInitial() : super(null);
}

class AuthenticationSuccess extends AuthenticationState {
  AuthenticationSuccess(UserModel firebaseUser) : super(firebaseUser);

  @override
  List<Object> get props => [firebaseUser];
}

class AuthenticationFailure extends AuthenticationState {
  AuthenticationFailure() : super(null);
}
