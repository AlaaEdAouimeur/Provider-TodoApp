class Task {
  String taskdata;
  bool iscomplete;
  Task(this.taskdata,this.iscomplete);
  void toggleTask(){
   iscomplete=!iscomplete;
  }
}