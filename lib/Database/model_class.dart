class UserModel {
  String? username;
  String? sessionId;
  String? consumerUuid;

  UserModel({this.username, this.sessionId, this.consumerUuid});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    sessionId = json['session_id'];
    consumerUuid = json['consumer_uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['username'] = username;
    data['session_id'] = sessionId;
    data['consumer_uuid'] = consumerUuid;
    return data;
  }
}