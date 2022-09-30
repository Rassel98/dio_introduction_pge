class UserModel {
  UserModel({
      this.page, 
      this.perPage, 
      this.total, 
      this.totalPages, 
      this.data, 
      this.support,});

  UserModel.fromJson(dynamic json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    support = json['support'] != null ? Support.fromJson(json['support']) : null;
  }
  num? page;
  num? perPage;
  num? total;
  num? totalPages;
  List<Data>? data;
  Support? support;
UserModel copyWith({  num? page,
  num? perPage,
  num? total,
  num? totalPages,
  List<Data>? data,
  Support? support,
}) => UserModel(  page: page ?? this.page,
  perPage: perPage ?? this.perPage,
  total: total ?? this.total,
  totalPages: totalPages ?? this.totalPages,
  data: data ?? this.data,
  support: support ?? this.support,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['per_page'] = perPage;
    map['total'] = total;
    map['total_pages'] = totalPages;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (support != null) {
      map['support'] = support?.toJson();
    }
    return map;
  }

}

class Support {
  Support({
      this.url, 
      this.text,});

  Support.fromJson(dynamic json) {
    url = json['url'];
    text = json['text'];
  }
  String? url;
  String? text;
Support copyWith({  String? url,
  String? text,
}) => Support(  url: url ?? this.url,
  text: text ?? this.text,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['text'] = text;
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.email, 
      this.firstName, 
      this.lastName, 
      this.avatar,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }
  num? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;
Data copyWith({  num? id,
  String? email,
  String? firstName,
  String? lastName,
  String? avatar,
}) => Data(  id: id ?? this.id,
  email: email ?? this.email,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  avatar: avatar ?? this.avatar,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['avatar'] = avatar;
    return map;
  }

}