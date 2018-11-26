import 'dart:convert' show json;

class Users {

  int statusCode;
  User data;

  Users.fromParams({this.statusCode, this.data});

  factory Users(jsonStr) => jsonStr == null ? null : jsonStr is String ? new Users.fromJson(json.decode(jsonStr)) : new Users.fromJson(jsonStr);

  Users.fromJson(jsonRes) {
    statusCode = jsonRes['statusCode'];
    data = jsonRes['data'] == null ? null : new User.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"statusCode": $statusCode,"data": $data}';
  }
}

class User {

  String email;
  String name;
  List<String> pics;

  User.fromParams({this.email, this.name, this.pics});

  User.fromJson(jsonRes) {
    email = jsonRes['email'];
    name = jsonRes['name'];
    pics = jsonRes['pics'] == null ? null : [];

    for (var picsItem in pics == null ? [] : jsonRes['pics']){
      pics.add(picsItem);
    }
  }

  @override
  String toString() {
    return '{"email": ${email != null?'${json.encode(email)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"pics": $pics}';
  }
}

