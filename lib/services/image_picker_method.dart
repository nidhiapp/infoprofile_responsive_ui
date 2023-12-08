import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

File? _pickedImage;
Uint8List webImage = Uint8List(8);

class ImagePickerMethod with ChangeNotifier {
  Future<void> pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        _pickedImage = selected;
        notifyListeners();
      } else {
        debugPrint("No image selected");
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var webSelctedImage = await image.readAsBytes();
        webSelctedImage = webImage;
        notifyListeners();
      } else {}
    }
  }
}
