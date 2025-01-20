import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Services/api_services.dart';
import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
import 'package:flutter_application_2/core/Services/local_services.dart';
import 'package:flutter_application_2/core/Services/sp_helper/sp_helper.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/BestSeller_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/Info_Cubit.dart';
import 'package:flutter_application_2/features/Home/view/NewArrivals/view/home/view_model/cubit/NewArrivals_cubit/NewArrivals_cubit.dart';
import 'package:flutter_application_2/features/Home/view/categories/model/cubit/Allcategories_cubit.dart';
import 'package:flutter_application_2/features/Home/view/categories/model/cubit/categories_cubit.dart';
import 'package:flutter_application_2/features/intro/logo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await AppLocalStorage().init();
  await ApiServices().init();
  await SharedPreferencHelper.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeCubit(),
      child: BlocProvider(
        create: (context) => NewArrivalsCubit(),
        child: BlocProvider(
          create: (context) => Infcubit(),
          child: BlocProvider(
            create: (context) => categoriesCubit(),
            child: BlocProvider(
              create: (context) => AllInfcubit(),
              child: const MaterialApp(
                debugShowCheckedModeBanner: false,
                home: logo(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
