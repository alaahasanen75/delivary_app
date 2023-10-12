import 'package:flutter_application_1/core/componant/constant.dart';
import 'package:flutter_application_1/core/componant/text_formfield.dart';
import 'package:flutter_application_1/core/network/dio_factory.dart';
import 'package:flutter_application_1/model_view/state_logincubit.dart';
import 'package:flutter_application_1/models/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(Initialstate());
  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? model;

  void Register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(LoadingRegisterShopAppState());

    DioHelper.postRegisterData(url: REGISTER, data: {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
    }).then((value) {
      model = LoginModel.fromJson(value.data);
      print(model!.masage);
      print(model!.status);
      print(model!.Data!.token);

      emit(SuccessfulyRegisterShopAppState(model));
    }).catchError((error) {
      print(error!.toString());
      emit(ErrorRegisterShopAppState(error.toString()));
    });
  }

  void UseLogin({var email, var password}) {
    emit(LoadingLoginShopAppState());

    DioHelper.postRegisterData(
        url: LOGIN, data: {'email': email, 'password': password}).then((value) {
      print(value.data);
      model = LoginModel.fromJson(value.data);
      print(model!.masage);
      print(model!.status);
      print(model!.Data!.token);

      emit(SuccessfulyLoginShopAppState(model));
    }).catchError((error) {
      print(error!.toString());
      emit(ErrorLoginShopAppState(error.toString()));
    });

// alaahasanen75@gmail.com
  }
}
