import 'package:flutter/material.dart';
import 'package:flying_school/core/services/authentication.dart';


class SignInManager{
  SignInManager({@required this.auth, @required this.isLoading});

  final AuthService auth;
  final ValueNotifier<bool> isLoading;

  Future<User> _signIn(Future<User> Function() signInMethod) async{
    try{
      isLoading.value =true;
      return await signInMethod();

    }catch(e){
      isLoading.value = false;
      rethrow;
    }

  }

}