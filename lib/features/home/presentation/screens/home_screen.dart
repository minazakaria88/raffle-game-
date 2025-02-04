import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raffle_game/features/home/presentation/manager/home_cubit.dart';
import 'package:raffle_game/features/home/presentation/manager/home_state.dart';
import '../widgets/header_widget.dart';
import '../widgets/show_result_widget.dart';
import '../widgets/start_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.maxNumber});
  final int maxNumber;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final Animation<Offset> animation;
  late final AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 0.4),
    ).animate(controller);

    super.initState();
  }

  void stopAnimation() {
    controller.stop();
  }

  void startAnimation() {
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state)async {
        if (state is HomeFinished) {
           stopAnimation();
          await context.read<HomeCubit>().player.pause();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const HeaderWidget(),
              const SizedBox(
                height: 20,
              ),
              ShowResultWidget(animation: animation),
              const SizedBox(
                height: 200,
              ),
               StartButton(
                onPressed: () {
                  if(controller.isAnimating) return;
                  context.read<HomeCubit>().getSelectedNumber(widget.maxNumber);
                  startAnimation();
                }
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




