class UserProfileModel {
  String? name, email, pass, image, uid, joinDate, mobile, username, gender, about, dob;
  List<String>? postList = [], followerList = [], followingList = [];

  UserProfileModel({
    this.uid,
    this.image,
    this.name,
    this.email,
    this.about,
    this.pass,
    this.gender,
    this.dob,
    this.joinDate,
    this.username,
    this.postList ,
    this.followerList ,
    this.followingList ,
    this.mobile = "",
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": uid,
      "name": name,
      "dob": dob,
      "about": about,
      "gender": gender,
      "username": username,
      "pass": pass,
      "image": image,
      "joinDate": joinDate,
      "email": email,
      "followerList": followerList,
      "followingList": followingList,
      "postList": postList,
      "mobile": mobile
    };
  }

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    UserProfileModel userModel = UserProfileModel(
      uid: json['id'],
      name: json['name'],
      pass: json['pass'],
      dob: json['dob'],
      image: json['image'],
      about: json['about'],
      gender: json['gender'],
      joinDate: json['joinDate'],
      username: json['username'],
      mobile: json['mobile'],
      email: json['email'],
      postList: json['postList'] != null ? List<String>.from(json['postList'])  : [],
      followerList: json['followerList'] != null ? List<String>.from(json['followerList'])  : [],
      followingList: json['followingList'] != null ? List<String>.from(json['followingList'])  : [],
    );
    return userModel;
  }
}