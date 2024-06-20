import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vocab_vortex/globals/helpers/widget_helper.dart';
import 'package:vocab_vortex/globals/style.dart';

class CustomInputWidget extends StatefulWidget {
  CustomInputWidget(
      {super.key,
      required this.controller,
      this.label,
      this.keyboardType,
      this.validator,
      this.isPassword = false,
      required this.hintText,
      this.prefixe,
      this.suffixe,
      this.radius = 10,
      this.maxLines = 1,
      this.onTap,
      this.readOnly = false,
      this.border = ColorStyles.kGrey,
      this.textInputAction,
      this.onFieldSubmitted,
      this.isRequired = false});
  final TextEditingController controller;
  final String? label;
  final IconData? prefixe;
  final IconData? suffixe;
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool isPassword;
  final int maxLines;
  final double radius;
  final Color border;
  final bool readOnly;
  final bool isRequired;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  void Function()? onTap;

  @override
  State<CustomInputWidget> createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputWidget> {
  bool passwordShow = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Column(
            children: [
              Row(
                children: [
                  Text(widget.label!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: ColorStyles.kBlack)),
                  if (widget.isRequired)
                    const Text(" *",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: ColorStyles.kRed)),
                ],
              ),
              const Gap(10),
            ],
          ),
        TextFormField(
            style: globalTextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
                color: ColorStyles.kWhite),
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            obscureText: widget.isPassword ? !passwordShow : false,
            onTap: widget.onTap,
            maxLines: widget.maxLines,
            textInputAction: widget.textInputAction,
            readOnly: widget.readOnly,
            onFieldSubmitted: widget.onFieldSubmitted,
            decoration: WidgetHelper.customDecorationMethod(
              border: widget.border,
              radius: widget.radius,
              label: widget.hintText,
              prefixIcon: widget.prefixe != null
                  ? Icon(
                      widget.prefixe,
                      color: ColorStyles.kBlack,
                    )
                  : null,
              suffixIcon: widget.suffixe != null
                  ? IconButton(onPressed: () {}, icon: Icon(widget.suffixe))
                  : widget.isPassword
                      ? passwordShow
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordShow = !passwordShow;
                                });
                              },
                              icon: const Icon(
                                Icons.visibility_off_outlined,
                                color: ColorStyles.kBlack,
                              ))
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordShow = !passwordShow;
                                });
                              },
                              icon: const Icon(
                                Icons.visibility_outlined,
                                color: ColorStyles.kBlack,
                              ))
                      : null,
            )),
      ],
    );
  }
}
