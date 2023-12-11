import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isSelected;
  final ValueChanged<bool?> onSelected;

  const CustomButton({super.key,
    required this.title,
    required this.subTitle,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(title,
                  style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),
                ),
                Text(subTitle, style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
              ],
            ),
            Radio<bool?>(
              value: true,
              groupValue: isSelected,
              onChanged: onSelected,
            ),
          ],
        )
    );
  }
}