import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Services/api_services.dart';
import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
import 'package:flutter_application_2/core/Services/local_services.dart';
import 'package:flutter_application_2/core/Services/sp_helper/sp_helper.dart';
import 'package:flutter_application_2/features/newarrivals/data/cubit/NewArrivals_cubit.dart';
import 'package:flutter_application_2/features/bestseller/data/BestSeller_cubit/Info_Cubit.dart';
import 'package:flutter_application_2/features/bestseller/data/BestSeller_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/categories/data/cubit/categories_cubit.dart';
import 'package:flutter_application_2/features/splash/spalsh_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await AppLocalStorage().init();
  await ApiServices().init();
  await SharedPreferencHelper.init();
  await ScreenUtil.ensureScreenSize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData(
      extensions: const [
        SkeletonizerConfigData(),
      ],
    );
    darkTheme:
    ThemeData(
      brightness: Brightness.dark,
      extensions: const [
        SkeletonizerConfigData.dark(),
      ],
    );
    return BlocProvider(
      create: (context) => homeCubit(),
      child: BlocProvider(
        create: (context) => NewArrivalsCubit(),
        child: BlocProvider(
          create: (context) => Infcubit(),
          child: BlocProvider(
            create: (context) => CategoriesCubit(),
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SpalshScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
