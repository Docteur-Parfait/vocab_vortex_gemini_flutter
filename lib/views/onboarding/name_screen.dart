import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';
import 'package:vocab_vortex/app/controllers/auth_controller.dart';
import 'package:vocab_vortex/globals/assets.dart';
import 'package:vocab_vortex/globals/string.dart';
import 'package:vocab_vortex/globals/style.dart';
import 'package:vocab_vortex/globals/widgets/global_custom_input.dart';

class NameScreen extends ConsumerStatefulWidget {
  const NameScreen({super.key});

  @override
  ConsumerState<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends ConsumerState<NameScreen> {
  final TextEditingController _name = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 100),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageAssets.nameBg), fit: BoxFit.cover)),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Hello 👋, please can I know your name?",
                  textAlign: TextAlign.center,
                  style: globalTextStyle(
                      fontSize: 35,
                      color: ColorStyles.kWhite,
                      fontWeight: FontWeight.w700),
                ),
                const Gap(20),
                CustomInputWidget(
                  controller: _name,
                  hintText: "Your name here",
                  validator:
                      Validatorless.required(ValidatorMessage.emptyMessage),
                ),
                const Gap(20),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> body = {"name": _name.value.text};

                      ref
                          .read(authControllerProvider)
                          .addName(context, body: body);
                    }
                  },
                  child: Image.asset(
                    IconAssets.next,
                    width: 160,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
