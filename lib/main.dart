import 'package:flutter/material.dart';
import 'package:raffle_game/core/routes/app_routes.dart';
import 'package:raffle_game/core/routes/routes.dart';

import 'core/utils/app_theme.dart';

void main() {
  runApp(const RaffleGame());
}

class RaffleGame extends StatelessWidget {
  const RaffleGame({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: Routes.inputScreen,

    );
  }
}

