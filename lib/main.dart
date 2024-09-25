import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
import 'package:flutter_application_2/core/Services/sp_helper/sp_helper.dart';
import 'package:flutter_application_2/features/Home/view_model/cubit/BestSeller_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/Home/view_model/cubit/NewArrivals_cubit/NewArrivals_cubit.dart';
import 'package:flutter_application_2/features/intro/logo.dart';
import 'package:flutter_application_2/features/profile/view/profile_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
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
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: profile(),
        ),
      ),
    );
  }
}
