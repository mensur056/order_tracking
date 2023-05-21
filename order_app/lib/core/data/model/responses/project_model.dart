class ProjectModel {
  String? title;
  String? image;
  String? subtitle;

  ProjectModel({this.title, this.image, this.subtitle});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    subtitle = json['subtitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['subtitle'] = subtitle;
    return data;
  }
}
