class Task{
  int? id;
  final String name;
  final String? priority;
  DateTime? dateandtime;
  bool isDone;

  Task({this.id, required this.name,this.priority,  this.dateandtime, this.isDone = false});

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'title' : name,
      'Priority': priority,
      'DateandTime': dateandtime.toString(),
      'isDone': isDone ? 1:0,
    };
  }

  String toString() {
    return 'Task(id : $id, title : $name, Priority: $priority, DateandTime : $dateandtime, isDone : $isDone)';
  }

  void donechange(){
    isDone = !isDone;
  }
}