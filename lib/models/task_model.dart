class Task {
  
  int id;
  String title;
  DateTime date;
  String priority;
  int status; // 0 - Incomplete, 1 - Complete

  Task({this.title, this.date, this.priority, this.status});
  Task.withId({this.id, this.title, this.date, this.priority, this.status});

  // ------------FUNCTION TO CONVERT DATA TO MAP------------
  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if(id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['date'] = date.toIso8601String();
    map['priority'] = priority;
    map['status'] = status;
    return map;
  }

  // ------------FUNCTION TO CONVERT MAP TO RAW DATA------------
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task.withId(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      priority: map['priority'],
      status: int.parse(map['status'])
    );
  }

}