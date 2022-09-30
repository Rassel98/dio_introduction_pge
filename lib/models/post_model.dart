class PostModel {
  PostModel({
      this.name, 
      this.job, 
      this.id, 
      this.createdAt,});

  PostModel.fromJson(dynamic json) {
    name = json['name'];
    job = json['job'];
    id = json['id'];
    createdAt = json['createdAt'];
  }
  String? name;
  String? job;
  String? id;
  String? createdAt;
PostModel copyWith({  String? name,
  String? job,
  String? id,
  String? createdAt,
}) => PostModel(  name: name ?? this.name,
  job: job ?? this.job,
  id: id ?? this.id,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['job'] = job;
     map['id'] = id;
    // map['createdAt'] = createdAt;
    return map;
  }

}