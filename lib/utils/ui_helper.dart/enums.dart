enum BuildType {
  dev,
  staging,
  prod,
}

enum MediaContentType { audio, image, video, none }

enum Status { ACTIVE, INACTIVE, ALL }

enum Gender { Men, Women, Coed }

enum Location { HOME, AWAY }

enum TicketPricing { PAID, FREE }

enum TicketCategoryType { General_Admission, Premium, Staff, Student }

enum TicketType { ADULT, CHILDREN, MILITARY, SENIOR_CITIZEN }

enum GamingType { GAMING, NON_GAMING }

enum PassType { All_Sports, Season }

enum RequestResource {
  camera,
  storage,
  microphone,
}

enum ApiRequest {
  apiGet,
  apiPost,
  apiPut,
  apiPatch,
  apiDelete,
}

enum ApiContentType { json, formData, formUrlEncoded }

//
enum UserDeviceType { mobile, tablet, desktop }


enum NotificationType { like , follow, comment }