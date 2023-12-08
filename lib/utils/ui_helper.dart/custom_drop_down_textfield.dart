import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';

class CustomDropdownFormField<T> extends StatefulWidget {
  final String label;
  final List<T> items;
  final T? value;
  final void Function(T?) onChanged;
  final String Function(T?)? itemLabel;
  final String? hintText;
  final String? errorText;
  final bool isDense;
  final bool isExpanded;
  final Color? borderColor;
  final Color? labelColor;
  final Color? dropdownIconColor;
  final bool useDatePicker;
  final IconData? suffIcon;
 final IconData? prefIcon;

  CustomDropdownFormField({
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
    this.itemLabel,
    this.hintText,
    this.errorText,
    this.isDense = false,
    this.isExpanded = true,
    this.borderColor,
    this.labelColor,
    this.dropdownIconColor=AppColors.primaryColor,
    this.useDatePicker = false,
    this.suffIcon,
    this.prefIcon
  });

  @override
  _CustomDropdownFormFieldState<T> createState() =>
      _CustomDropdownFormFieldState<T>();
}

class _CustomDropdownFormFieldState<T>
    extends State<CustomDropdownFormField<T>> {
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    if (widget.useDatePicker) {
      // Use date picker instead of dropdown
      return GestureDetector(
         child: TextFormField(
          style: AppStyle.custompoppinNormalTs ,
          readOnly: true,
          controller: TextEditingController(
            text: _selectedDate != null
                ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                : "",
          ),
          decoration: InputDecoration(
           
            hintText: widget.hintText,
             hintStyle: AppStyle.custompoppinGreyNormalTs,
            errorText: widget.errorText,
           
             enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: widget.borderColor ?? Colors.blue),
          ),
            focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: widget.borderColor ?? Colors.blue),
          ),
           errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
            suffixIcon: InkWell(onTap: () async{
               DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: _selectedDate ?? DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );

              if (selectedDate != null && selectedDate != _selectedDate) {
                setState(() {
                  _selectedDate = selectedDate;
                });

                widget.onChanged(selectedDate as T);
              }
            },
              child: Icon(
                Icons.calendar_month,
                color: widget.dropdownIconColor,
              ),
            ),
          ),
        ),
      );
    } else {
      return DropdownButtonFormField<T>(
        value: widget.value,
        onChanged: widget.onChanged,
        items: widget.items.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(
              widget.itemLabel?.call(item) ?? item.toString(),
              style: AppStyle.custompoppinNormalTs,
            ),
          );
        }).toList(),
        decoration: InputDecoration(
          suffixIcon:Icon(widget.suffIcon),
          // prefixIcon:Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: ImageIcon(AssetImage(AppImages.genderIcon,),
          //   color: AppColors.primaryColor,),
          // ),
         prefixIcon: Icon(widget.prefIcon,color: AppColors.primaryColor,),
          hintText: widget.hintText,
          hintStyle: AppStyle.custompoppinGreyNormalTs,
          errorText: widget.errorText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: widget.borderColor ?? Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: widget.borderColor ?? Colors.blue),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          // prefixIcon: Icon(
          //   Icons.arrow_drop_down,
          //   color: AppColors.primaryColor,
          // ),
        ),
      );
    }
  }
}
