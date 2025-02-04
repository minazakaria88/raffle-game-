import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raffle_game/core/routes/routes.dart';
import 'package:raffle_game/features/home/presentation/manager/home_cubit.dart';
import 'package:raffle_game/features/home/presentation/screens/home_screen.dart';
import 'package:raffle_game/features/home/presentation/screens/input_screen.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings setting) {
    final arguments=setting.arguments;
    switch (setting.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit(),
            child:  HomeScreen(
              maxNumber: arguments as int,
            ),
          ),
        );
      case Routes.inputScreen:
        return MaterialPageRoute(builder: (context) => const InputScreen());
      default:
        return null;
    }
  }
}
