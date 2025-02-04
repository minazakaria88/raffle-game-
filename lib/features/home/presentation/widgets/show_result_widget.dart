import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/assets.dart';
import '../manager/home_cubit.dart';
import '../manager/home_state.dart';

class ShowResultWidget extends StatelessWidget {
  const ShowResultWidget({
    super.key,
    required this.animation,
  });

  final Animation<Offset> animation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: Container(
        margin: const EdgeInsets.all(20),
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                var cubit = context.read<HomeCubit>();
                if (state is HomeFinished) {
                  return Text(
                    cubit.selectedNumber,
                    style: Theme.of(context).textTheme.headlineLarge,
                  );
                }
                return Image.asset(
                  Assets.imagesEmoji,
                  width: 100,
                  height: 100,
                );
              }),
        ),
      ),
    );
  }
}
