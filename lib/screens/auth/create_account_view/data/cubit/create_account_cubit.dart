import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:level_1_task_gdg/core/api/api_consumer.dart';
import 'package:level_1_task_gdg/core/api/api_end_point.dart';
import 'package:level_1_task_gdg/core/errors/exceptions.dart';
import 'package:level_1_task_gdg/screens/auth/create_account_view/data/cubit/model/create_account_model.dart';
import 'package:meta/meta.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit(this.api) : super(CreateAccountInitial());

  final ApiConsumer api;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  
  createAccount() async {
    if (_validateInputs()) {
      try {
        emit(CreateAccountLoading());

        final response = await api.post(
          ApiEndPoint.signUp,
          data: {
            'username': usernameController.text,
            'password': passwordController.text,
            'email': emailController.text,
          },
        );

        final createAccountModel = CreateAccountModel.fromJson(response);

        

        emit(CreateAccountSuccess());
      } on ServerException catch (e) {
        emit(CreateAccountError(error: e.errorsModel.errorMessage));
      }
    }
  }

 bool _validateInputs() {
  if (usernameController.text.isEmpty) {
    emit(CreateAccountError(error: 'Please enter a username'));
    return false;
  }
  if (passwordController.text.isEmpty || passwordController.text.length < 6) {
    emit(CreateAccountError(error: 'Password must be at least 6 characters long'));
    return false;
  }
  if (emailController.text.isEmpty || !emailController.text.contains('@')) {
    emit(CreateAccountError(error: 'Please enter a valid email address'));
    return false;
  }
  return true;
}

}
