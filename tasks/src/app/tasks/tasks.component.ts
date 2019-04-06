import { Component, OnInit } from '@angular/core';
import { TaskService } from '../task.service';
import $ from 'jquery';


@Component({
  selector: 'app-tasks',
  templateUrl: './tasks.component.html',
  styleUrls: ['./tasks.component.css']
})
export class TasksComponent implements OnInit {
   taskTitle:string;
   isDone:string = "false";
   tasks = [];
    constructor(private taskServiceObject: TaskService) {

  }

 
  ngOnInit() {
    this.getTasksByAjax();
  }

/**
* this is fatch api 
*/
  getTasksByFetch(){
    let p = this.taskServiceObject.fatchTasks();
    p.then(function(response){
      return response.json();
    }).then( function(data) {
      console.log(data);
    }).catch(function(error){
      console.log(error);
    })
  }

 /**
 * this is ajax jquery
 */

  getTasksByAjax(){
    let p = this.taskServiceObject.getTasks();
    p.then((response) =>{
      this.tasks = response;
    }).catch(function(error){
      console.log(error);
    })
  }

  /** 
  * saveTask
  */
  createTaskInComponent(){
    let task = {title:this.taskTitle, isDone:this.isDone};
    console.log(task);
    let p = this.taskServiceObject.saveTask(task);
    p.then((response) => {
      this.getTasksByAjax();
      this.taskTitle = "";
    })
  }
}

