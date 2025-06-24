import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_n_goo/cubit/auth/auth_states.dart';
import 'package:shop_n_goo/data/data_sources/auth_data_source.dart';
import 'package:shop_n_goo/data/models/auth/request/LoginRequest.dart';
import 'package:shop_n_goo/data/models/auth/request/register_request.dart';
import 'package:shop_n_goo/data/models/auth/response/login_response.dart';
import 'package:shop_n_goo/data/models/auth/response/register_response.dart';

class AuthCubit extends Cubit<AuthStates>
{
  AuthCubit() : super(AuthInitialState());
  final AuthDataSource _authDataSource = AuthDataSource();

  Future<void> login(LoginRequest loginRequest)
  async{
    emit(AuthLoadingState());
    try
        {
          final LoginResponse response = await _authDataSource.login(loginRequest);
          emit(AuthSuccessState());
        }
        catch(exception) {
          emit(AuthErrorState(exception.toString()));
        }
  }

  Future<void> register(RegisterRequest registerRequest)
  async{
    emit(AuthLoadingState());
    try
    {
      final RegisterResponse response = await _authDataSource.register(registerRequest);
      emit(AuthSuccessState());
    }
    catch(exception) {
      emit(AuthErrorState(exception.toString()));
    }
  }

}