import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
class CustomToast {
  String message;
  CustomToast({required BuildContext context, required this.message}) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Padding(
        padding: const EdgeInsets.only(bottom: 130),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade900, width: 1)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Flexible( child: Icon(Icons.notifications_on_rounded, color: AppColors.blackNormalTextColor,),),
                const SizedBox(width: 8),
                Flexible(
                  child: Text( message, style: const TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    overlay.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}