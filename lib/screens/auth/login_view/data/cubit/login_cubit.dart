
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:level_1_task_gdg/cache/cache_helper.dart';
import 'package:level_1_task_gdg/core/api/api_consumer.dart';
import 'package:level_1_task_gdg/core/api/api_end_point.dart';
import 'package:level_1_task_gdg/core/errors/exceptions.dart';
import 'package:level_1_task_gdg/screens/auth/login_view/data/cubit/model/login_model.dart';

part 'login_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.api) : super(SignInInitialState());
  final ApiConsumer api;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  LoginModel? loginToken;
  signIn() async {
    try {
      emit(SignInLoadingState());
      final response = await api.post(
        ApiEndPoint.signIn,
        data: {
          'username': usernameController.text,
          'password': passwordController.text,
        },
      );
      loginToken = LoginModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(loginToken!.token);
      CacheHelper().saveData(key: 'token', value: loginToken!.token);
      CacheHelper().saveData(key: 'id', value: decodedToken['id']);

      emit(SignInSuccessState());
    } on ServerException catch (e) {
      emit(SignInErrorState(error: e.errorsModel.errorMessage));
    }
  }


  bool validateInputs() {
    if (usernameController.text.isEmpty) {
      emit(SignInErrorState(error: 'Please enter your username'));
      return false;
    }
    if (passwordController.text.isEmpty) {
      emit(SignInErrorState(error: 'Please enter your password'));
      return false;
    }
    return true;
  }
}
