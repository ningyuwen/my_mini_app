import 'package:json_annotation/json_annotation.dart';


class LoginBeen {

  var userId;
  var openid;
  var username;
  var headUrl;
  var sex;

  LoginBeen(this.userId, this.openid, this.username, this.headUrl, this.sex);

  LoginBeen.fromJson(Map<String, dynamic> json) :
        userId = json["id"],
        openid = json['openid'],
        username = json['username'],
        headUrl = json['headUrl'],
        sex = json['sex'];

  Map<String, dynamic> toJson() =>
      {
        'id': userId,
        'openid': openid,
        'username': username,
        'headUrl': headUrl,
        'sex': sex
      };

}