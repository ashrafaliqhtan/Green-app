class EventModel {
  String? id;
  String? title;
  String? description;
  String? location;
  String? locationUrl;
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
      this.locationUrl,
      this.imageUrl});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['event_id'];
    title = json['name'];
    description = json['content'];
    location = json['location'];
    startDate = json['date_start'];
    startTime = json['time_end'];
    endDate = json['end_date'];
    endTime = json['time_end'];
    imageUrl = json['image_url'];
    state = json['state'];
    locationUrl = json['location_url'];
    maximumCapacity = json["maximam_number_of"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = id;
    data['name'] = title;
    data['content'] = description;
    data['location'] = location;
    data['location_url'] = locationUrl;
    data['date_start'] = startDate;
    data['time_start'] = startTime;
    data['end_date'] = endDate;
    data['time_end'] = endTime;
    data['image_url'] = imageUrl;
    data['maximam_number_of'] = maximumCapacity;
    return data;
  }
}
