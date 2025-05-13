import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/home/manager/cubit/user_cubit/user_state.dart';

import '../../../data/models/user_model.dart';


class UserCubit extends Cubit<UserState>
{
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  void getUserData({required UserModel user})
  {
    emit(UserGetSuccess(userModel: user));
  }

}