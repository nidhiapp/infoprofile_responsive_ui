

class ApiNotification {
  NotificationTypes? type;
  String? id;
  String? time;
  String? message;
  String? sentById;
  String? sentToId;
  String? activityId;
  String? sentByImage;
  String? sentByName;
  String? sentByUsername;

  ApiNotification(
      {this.type,
      this.message,
      this.activityId,
      this.sentById,
      this.sentByImage,
      this.sentByName,
      this.sentByUsername,
      this.sentToId,
      this.time,
      this.id});

  factory ApiNotification.fromJson({required Map<String, dynamic> json}) {
    return ApiNotification(
      id: json['id'],
      type: json['type'] == ('NotificationTypes.comment')
          ? NotificationTypes.comment
          : json['type'] == 'NotificationTypes.like'
              ? NotificationTypes.like
              : NotificationTypes.follow,
      activityId: json['activityId'],
      time: json['time'],
      message: json['message'],
      sentById: json['sentById'],
      sentToId: json['sentToId'],
      sentByImage: json['sentByImage'],
      sentByName: json['sentByName'],
      sentByUsername: json['sentByUsername'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type.toString(),
      'time': time,
      'activityId': activityId,
      'message': message,
      'sentById': sentById,
      'sentToId': sentToId,
      'sentByImage': sentByImage,
      'sentByName': sentByName,
      'sentByUsername': sentByUsername,
    };
  }
}

class NotificationList {
  List<String>? notificationIds;
  NotificationList({this.notificationIds});

  factory NotificationList.fromJson(Map<String, dynamic> json) {
    return NotificationList(
        notificationIds: (json['notificationIds'] as List<dynamic>?)
            ?.map((item) => item.toString())
            .toList());
  }

  Map<String, dynamic> toMap() {
    return {'notificationIds': notificationIds};
  }
}

class NotificationListModel {
  List<ApiNotification>? notificationList;

  NotificationListModel({this.notificationList});

  factory NotificationListModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json['notificationList'] ?? [];
    List<ApiNotification> notifications = list
        .map((item) {
          return ApiNotification.fromJson(json: item);
        })
        .toList()
        .cast<ApiNotification>();
    return NotificationListModel(notificationList: notifications);
  }

  Map<String, dynamic> toJson() {
    return {
      'notificationList':
          notificationList?.map((item) => item.toMap()).toList(),
    };
  }
}

enum NotificationTypes {
  follow,
  comment,
  like
  // Add other notification types as needed
}
