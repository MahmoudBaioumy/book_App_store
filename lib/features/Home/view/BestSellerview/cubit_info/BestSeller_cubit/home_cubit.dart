import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
import 'package:flutter_application_2/core/Services/dio_helper/endPoint.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/BestSeller_cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../BestSellerModel/bestseller_model.dart';

class homeCubit extends Cubit<homeStates> {
  homeCubit() : super(homeInitState());
  static homeCubit get(context) => BlocProvider.of(context);

  getdata() {
    emit(homeLoadingState());
    DioHelper.getData(
      url: EndPoint.bestseller,
    ).then((value) {
      // print(value.data);
///////////////import/////////////////////////////////////////////////////
      var model = BestSellerModel.fromJson(value.data);
      emit(homeSuccessState(model: model));
    }).catchError((onError) {
      emit(homeErrorState(error: 'error'));
    });
  }


}
