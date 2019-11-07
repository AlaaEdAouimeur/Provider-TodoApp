import 'package:flutter/material.dart';
import 'package:planets/TaskModel.dart';
import 'package:planets/Tasks.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  String task;
  Widget bottomsheet(BuildContext context){
    

     return Container(
       height: 500,
       child: 
              Padding(
                padding:  EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text('Add task',textAlign: TextAlign.center,style: TextStyle(fontSize: 25,color: Colors.amberAccent),),
                    TextField(

                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: 'I wanna...',
                        border: OutlineInputBorder()
                      ),
                     
                      
                      
                      onChanged: (val){
                     
                        task = val;
                       
                        Provider.of<Tasks>(context).settotrue();
                      },
                   
                    ),
                    FlatButton(
                      
                      child: Text('Add',style: TextStyle(fontSize: 25),),
                      color: Colors.amberAccent,
                      onPressed: !Provider.of<Tasks>(context).isvalide? null : (){
                        
                         Provider.of<Tasks>(context).addTask(task);
                         Provider.of<Tasks>(context).settofalse();
                        Navigator.pop(context);
                      }
                    )
                  ],
                ),
              ),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Header(),
            flex: 1,
          ),
          Expanded(
            child: Taskview(),
            flex: 3,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color:Colors.white),
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
            
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
            context: context,
            builder: (context){
            return bottomsheet(context);
            }
          );
        },
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.deepPurple),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
           
           Expanded(child: Container(child: Text('Hey👋 \nAlaa,you have ${Provider.of<Tasks>(context).unfTasks} unfinished tasks',textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color: Colors.white),),)),
          ],
        ),
      ),
    );
  }
}

class Taskview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TaskList(),
      //     height: 500,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18))),
    );
  }
}

class TaskCell extends StatelessWidget {
  Function onPressed;
  Task task;
  TaskCell(this.task, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        task.taskdata,
        style: TextStyle(color: Colors.black87, fontSize: 20,decoration: task.iscomplete? TextDecoration.lineThrough :null),
      ),
      trailing: Checkbox(
          value: task.iscomplete,
          onChanged: onPressed,
          checkColor: Colors.white),
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) {
        return TaskCell(
            Provider.of<Tasks>(context).tasks[i],
            (f){
                 Provider.of<Tasks>(context)
                .updateTask(Provider.of<Tasks>(context).tasks[i]);
            }
         );
      },
      itemCount: Provider.of<Tasks>(context).taskcount,
    );
  }
}
