class EventModel {
  String? id;
  String? title;
  String? description;
  String? location;
  String? startDate;
  String? startTime;
  String? endDate;
  String? endTime;
  String? state;
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
      this.state,
      this.maximumCapacity,
      this.imageUrl
      });

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['event_id'];
    title = json['name'];
    description = json['content'];
    location = json['location'];
    startDate = json['date_start'];
    startTime = json['time_end'];
    endDate = json['end_date'];
    endTime = json['time_end'];
    imageUrl = json['imageUrl'];
    state = json['state'];
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
