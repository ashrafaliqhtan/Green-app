class EventModel {
  String? id;
  String? title;
  String? description;
  String? location;
  String? startDate;
  String? startTime;
  String? endDate;
  String? endTime;
  int? maximumCapacity;
  String? imageUrl;

  EventModel(
      {this.id,
      this.title,
      this.description,
      this.location,
      this.startDate,
      this.startTime,
      this.endDate,
      this.endTime,
      this.maximumCapacity,
      this.imageUrl
      });

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    location = json['location'];
    startDate = json['startDate'];
    startTime = json['startTime'];
    endDate = json['endDate'];
    endTime = json['endTime'];
    imageUrl = json['imageUrl'];
    maximumCapacity=json["maximam_number_of"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.title;
    data['content'] = this.description;
    data['location'] = this.location;
    data['startDate'] = this.startDate;
    data['startTime'] = this.startTime;
    data['endDate'] = this.endDate;
    data['endTime'] = this.endTime;
    data['imageUrl'] = this.imageUrl;
    data['maximam_number_of']=this.maximumCapacity;
    return data;
  }
}
