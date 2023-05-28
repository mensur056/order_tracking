class OrderModel {
  String? title;
  String? image;
  String? time;

  OrderModel({this.title, this.image, this.time});

  OrderModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['time'] = time;
    return data;
  }
}
