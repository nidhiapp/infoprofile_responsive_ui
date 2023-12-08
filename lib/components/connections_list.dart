import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';

class ConnectionsListBox extends StatelessWidget {
  const ConnectionsListBox({
  super.key, 
  this.connectionName="nidhi ",
  });
  final String connectionName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: AppColors.borderCol)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                
                  Expanded(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: AppLink.defaultFemaleImg,
                            height: 33,
                            width: 33,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Text(
                          connectionName,
                          style: AppStyle.connectionTextName,
                        ))
                      ],
                    ),
                  ),
                  Text(
                    "Remove",
                    style: AppStyle.connectionTextRemove,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
