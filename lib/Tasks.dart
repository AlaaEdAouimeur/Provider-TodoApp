import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:planets/TaskModel.dart';

class Tasks extends ChangeNotifier {
 
  List<Task> tasks = [
    Task('Buy milk', false),
     Task('Go to gym', true),
      Task('Read the book', false),
  ];
  int get taskcount => tasks.length;
  void addTask(String taskdata){
    Task task = new Task(taskdata, false);
    tasks.add(task);
    notifyListeners();
    print('Task added');
  }
  void deleteTask(int index){
    tasks.removeAt(index);
    notifyListeners();
  }
  int get unfTasks {
    int n=0;
   for(Task task in tasks){
    ! task.iscomplete? n++:null;
   }
   return n;
  
  }
 bool isvalide=false;
 void settofalse(){
   isvalide=false;
   notifyListeners();
 }
  void settotrue(){
   isvalide=true;
   notifyListeners();
 }
   void updateTask(Task task){
     task.toggleTask();
     notifyListeners();
   }
}