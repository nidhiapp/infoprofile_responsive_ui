import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/global.dart';

class MapSectionBg extends StatelessWidget {
  const MapSectionBg({super.key});

  @override
  Widget build(BuildContext context) {
 
    return Column(
      children: [
        SizedBox(
          height: h * 0.05,
        ),
        Row(
          children: [
            Expanded(
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    AppImages.mapsecbg,
                    height: h * 0.4,
                  )),
            )
          ],
        ),
      ],
    );
  }
}
