import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:info_profile_ui/models/user_profile.dart';
import 'package:info_profile_ui/repository/feed/feed_apis.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';

class EditProfileProvider extends ChangeNotifier {
  final FirebaseFeedRepo _api = FirebaseFeedRepo();
  bool _isEdit = true;

  set isEdit(bool val) {
    _isEdit = val;
    notifyListeners();
  }

  bool get isEdit => _isEdit;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  bool isPicked = false;

  File? _pickedImage;
  get pickedImage => _pickedImage;
  Uint8List? webImage = Uint8List(8);
  void pickImageFromDevice() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var webSelectedImageBytes = await image.readAsBytes();
      webImage = webSelectedImageBytes;
      _pickedImage = File('a');
      // debugPrint("Image Picked path is ----> ${webImage}");
      isPicked = true;
      await uploadImage().then((value) async {
        await _api.updateImageInProfile(value!);
      });
    } else {
      isPicked = false;
    }
    notifyListeners();
  }

  String? imagePath = AppLink.defaultFemaleImg;
  Future<String?> uploadImage() async {
    if (!isPicked) {
      debugPrint("Image not Picked");
      return null;
    } else {
      await _api.uploadProfileImage(webImage!).then((image) {
        debugPrint("Image has been uploaded Url:$imagePath");
        imagePath = image;
      }).onError((error, stackTrace) {
        debugPrint("Error while uploading image $error");
        resetImage();
        return null;
      });
    }
    debugPrint("Image Uploaded");
    notifyListeners();
    return imagePath;
  }

  void resetImage() {
    isPicked = false;
    webImage = null;
    _pickedImage = null;
    setLoading(false);
    notifyListeners();
  }

  Stream<UserProfileModel?> getUserDetails({String? id}) {
    final user = _api.getUserData(id: id);
    return user;
  }

  Future updateProfile(
      {required String name,
      required String username,
      required String gender,
      required String dob,
      required String about,
      required String mobile,
      required String email}) async {
    setLoading(true);
    await _api.updateProfileData(
        name: name,
        username: username,
        gender: gender,
        dob: dob,
        about: about,
        mobile: mobile,
        email: email);
         setLoading(false);
  }
  
}
