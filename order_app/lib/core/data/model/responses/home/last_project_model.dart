class LastProjectModel {
  String? image;
  String? title;
  String? time;

  LastProjectModel({this.image, this.title, this.time});

  LastProjectModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['time'] = time;
    return data;
  }
}
