import 'package:flutter/material.dart';
import 'package:raffle_game/core/routes/routes.dart';
import 'package:raffle_game/features/home/presentation/widgets/start_button.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  TextEditingController controller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Flexible(
                  child: SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Enter The Maximum Number',
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'required';
                          } else {
                            try {
                              int.parse(value);
                            } catch (e) {
                              return 'Enter a valid Number';
                            }
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                StartButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.home,
                        (route) => false,
                        arguments: int.parse(controller.text)
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
