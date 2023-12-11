
import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';

class CustomDialogBox extends StatelessWidget {
  final String title;
  final String content;
  final Function(bool) onAction;
  final Color ?color;

  const CustomDialogBox({
    required this.title,
    required this.content,
    required this.onAction,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(backgroundColor: AppColors.logincardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    onAction(false); // User selected "No"
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text('No',style: TextStyle(color: Colors.black)),
                ),
                TextButton(
                  onPressed: () {
                    onAction(true); // User selected "Yes"
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text('Yes',style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
