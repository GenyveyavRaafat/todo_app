class Task{
  int? id;
  late final String name;
  late final String priority;
  late final String Notes;
  String? date,startTime,endTime;
  bool isDone;
  bool isDeleted;

  Task({this.id, required this.name, this.priority = 'High', required this.Notes,  this.date, this.startTime,this.endTime, this.isDone = false, this.isDeleted = false});

   Map<String, dynamic> toMap(){
    return{
      'id':id,
      'title' : name,
      'Priority': priority,
      'Notes': Notes,
      'isDone': isDone ? 1:0,
    };
  }

  /* String toString() {
    return 'Task(id : $id, title : $name, Priority: $priority,Notes:$Notes, DateandTime : $dateandtime, isDone : $isDone)';
  } */

  void donechange(){
    isDone = !isDone;
  }
  void archivedTask(){
    isDeleted = !isDeleted;
    donechange();
  }
  
}