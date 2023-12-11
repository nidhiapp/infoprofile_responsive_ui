class AppKeys {
  static const String appName = '1Vision';
  static const String token = 'token';
  static const String email = 'email';
  static const String password = 'password';
  static const String somethingWentWrong = 'Something Went Wrong';
  static const String id = 'id';
  static const String createSponsors = 'createSponsors';
  static const String isSponserAdded = 'isSponserAdded';
  static const String updateSponsors = 'updateSponsors';
}

abstract class ApiKeys {
  // HEADER keys
  static const String getMethod = 'GET';
  static const String postMethod = 'POST';
  static const String patchMethod = 'PATCH';
  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String formData = 'multipart/form-data';
  static const String authorization = 'Authorization';
  static const String accept = 'Accept';
  static const String userAgent = 'User-Agent';
  static const String formUrlEncoded = 'application/x-www-form-urlencoded';

  // request keys
  static const String fields = 'fields';
  static const String files = 'files';
  static const String error = 'Error';
  static const String msg = 'msg';
  static const String status = 'status';
  static const String message = 'message';
  static const String data = 'data';
  static const String token = 'token';
  static const String loginType = 'loginType';
}

class AppPreferenceKeys {
  static const String token = 'token';
  static const String userID = 'userID';
  static const String isForceUpdate = 'isForceUpdate';
  static const String userData = 'userData';
  static const String businessData = 'businessData';
  static const String insightData = 'insightData';
  static const String profileLinkData = 'profileLinkData';
  static const String isLoggedIn = 'isLoggedIn';
  static const String dynamicLink = 'dynamicLink';
  static const String dynamicUserName = 'dynamicUserName';
}

abstract class AppFonts {
  static const montserrat = 'Montserrat';
}

abstract class FirebaseKey{
  static const String postKey = "post";
  static const String commentKey = "comment";
  static const String likeKey = "like";
  static const String userKey = "users";
  static const String reportPostKey = "reportPost";
  static const String reportCommentKey = "reportComment";
  static const String notificationKey = "notification";
  static const String userNotification = "userNotification";
}
