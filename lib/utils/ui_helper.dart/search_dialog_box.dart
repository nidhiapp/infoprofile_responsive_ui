import 'package:flutter/material.dart';
import 'package:info_profile_ui/models/user_profile.dart';


class ShowSearchDialog {
  static void showUserSearchDialog(BuildContext context, List<UserProfileModel> users, Future<bool?> Function(String) onTapCallback) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title:const Text('User Search Results'),
          content: SizedBox(
            width: 500,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey), // Adjust border color as needed
                      borderRadius:const BorderRadius.all(Radius.circular(8.0))),
                  margin:const EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    leading: Container(
                      width: 35,
                      height: 35,
                      decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: Colors.grey)
                      ),
                      child:const Center(
                        child:Icon(Icons.person,color:Colors.grey,),
                      ),
                    ),
                    trailing:InkWell(
                        onTap: () {
                          onTapCallback(user.uid!);
                        },
                        child: const Icon(Icons.person_add_alt)),
                    title: Text(user.email ?? 'Unknown'),
                    subtitle: Text(user.username ?? 'No profile'),

                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child:const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}