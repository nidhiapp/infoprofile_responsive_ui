import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class ProfileDialog extends StatelessWidget {
  final String imageUrl;
  //final Size dialogSize;

  ProfileDialog({
    required this.imageUrl,
  //  required this.dialogSize,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 400,
        height:400,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}