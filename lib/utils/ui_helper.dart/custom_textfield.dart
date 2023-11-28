import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view_model/provider.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintext = "",
    this.labeltexts = "",
    this.prefixicon,
    this.suffixicon,
    this.keyboardType,
    this.focusNode,
    this.onFieldSubmitted,
    this.icons,
    required this.customController,
    this.customValidator,
    this.isPasswordField=false,
  });
  final String hintext;
  final String labeltexts;
  final IconData? prefixicon;
  final IconData? suffixicon;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Function(String?)? onFieldSubmitted;
  final IconData? icons;
  final bool isPasswordField;
  final TextEditingController customController;
  final String? Function(String?)? customValidator;

  @override
  Widget build(BuildContext context) {
    return Consumer<Providers>(
      builder: (context, value, child) {
        return TextFormField(
          validator: customValidator,
          focusNode: focusNode,
          controller: customController,
          obscureText:isPasswordField && value.isHide,
          obscuringCharacter: '*',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyboardType,
         
           style: custompoppinNormalTs,
          decoration: InputDecoration(
            suffixIcon: isPasswordField
                ? IconButton(
                    onPressed: () {
                      value.showHidePassword();
                    },
                    icon: value.isHide
                        ? Icon(suffixicon,color: AppColors.blackNormalTextColor)
                        : const Icon(Icons.visibility_off,color: AppColors.blackNormalTextColor),
                  )
                : null,
            hintText: hintext,
         
            hintStyle: custompoppinGreyNormalTs,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            prefixIcon: Icon(
              prefixicon,
              color: AppColors.blackNormalTextColor,
            ),
            
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(10.0),
            ),
          
          ),
          onFieldSubmitted: onFieldSubmitted,
          maxLines: isPasswordField && value.isHide ? 1 : 1,
        );
      },
    );
  }
}
