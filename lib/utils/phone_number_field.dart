import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:kooha_movie_app/utils/pallet.dart';
import 'package:kooha_movie_app/utils/style_manager.dart';

class CustomPhoneNumberInput extends StatelessWidget {
  final Function? onSubmit;
  final Function(PhoneNumber)? onSaved;
  final Function(PhoneNumber)? onInputChanged;
  String? isoCode;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextStyle? style;

  CustomPhoneNumberInput(
      {Key? key,
        this.onSubmit,
        this.style,
        this.onSaved,
        this.isoCode,
        this.onInputChanged,
        this.controller,
        this.validator,
        this.hint = "Phone Number"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 5.0,
          ),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 2,color:AppColor.primaryColor.withOpacity(.4), )
          ),
          child:
    Builder(
    builder: (BuildContext context) {
    final fontSize = style?.fontSize == null
    ? 16 / MediaQuery.textScaleFactorOf(context)
        : style!.fontSize! / MediaQuery.textScaleFactorOf(context);
    return
          InternationalPhoneNumberInput(
            textStyle:getLightStyle(
              color: AppColor.grey,
            fontSize: 16,
            ).copyWith(fontSize: fontSize),
            selectorTextStyle: getLightStyle(
              color: AppColor.grey,
              fontSize: 16,
            ).copyWith(fontSize: fontSize),
            initialValue: PhoneNumber(isoCode: 'NG', dialCode:'+234'),
            onInputChanged: (PhoneNumber number) => onInputChanged!(number),
            validator: validator,
            keyboardType: const TextInputType.numberWithOptions(
              signed: true,
              decimal: true,
            ),
            inputDecoration:
            InputDecoration(
              isDense: true,
              hintStyle:getLightStyle(
                fontSize: 16,
                color: AppColor.grey,
              ).copyWith(fontSize: fontSize),
              border: InputBorder.none,
              hintText: hint!,
            ),
            textFieldController: controller,
            // initialValue: PhoneNumber(isoCode: isoCode!),
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            ),
            ignoreBlank: true,
            autoValidateMode: AutovalidateMode.disabled,
            onSaved: (PhoneNumber number) => {onSaved!(number)},
            onSubmit: () => onSubmit!(),
          );
        })),
      ],
    );
  }
}
