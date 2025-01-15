import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
import 'package:flutter_application_2/features/fav/model/cubit/fav_states.dart';
import 'package:flutter_application_2/features/fav/model/favModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class favcubit extends Cubit<favStates> {
  favcubit() : super(favIntstate());
  static favcubit get(context) => BlocProvider.of(context);
   favModel? model;
  ///////send the id to get it ///////////////////////////////
  addfav({required int id,required String token}) {
    emit((favoLoadingState()));
    /////////send the id ////////////////////////////////////////////
    DioHelper.grtDataByIdandtoken(id: id, token: token).then((value) 
    {
      model = favModel.fromJson(value.data);
      print(model);
      emit(favSuccessState(Model: model));
    }
    ).catchError((onError) {
      emit(favErrorState(error: onError.toString()));
    });
  }
}
