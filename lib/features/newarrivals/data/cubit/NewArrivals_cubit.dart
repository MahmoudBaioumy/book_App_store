import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
import 'package:flutter_application_2/core/Services/dio_helper/endPoint.dart';
import 'package:flutter_application_2/features/newarrivals/data/model/NewArrivals_model.dart';
import 'package:flutter_application_2/features/newarrivals/data/cubit/NewArrivals_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewArrivalsCubit extends Cubit<NewArrivalsState> {
  NewArrivalsCubit() : super(newarrivalsinitState());
  static NewArrivalsCubit get(context) => BlocProvider.of(context);

  NewArrivalsmodel? newarrivalsmodel;
  getNewArrivals() {
    emit(newarrivalsloadingState());
    DioHelper.getData(url: EndPoint.NewArrivals).then((value) {
      newarrivalsmodel = NewArrivalsmodel.fromJson(value.data);
      emit(newarrivalsSuccessState());
    }).catchError((onError) {
      emit(newarrivalsErrorState(error: 'error'));
    });
  }
}
