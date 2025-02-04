import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    super.key, required this.onPressed,
  });
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onPressed();
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color(0xffEFB036),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5,
              ),
            ]),
        width: 200,
        child: Center(
          child: Text(
            'ابدأ',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
